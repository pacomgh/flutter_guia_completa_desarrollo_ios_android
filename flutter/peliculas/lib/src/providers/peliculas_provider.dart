import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{
  String _apiKey    = 'e025d77ce91c7b698e4af70d16ca4a4f';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';
  int _popularesPage = 0;
  bool _cargando  = false;

  List<Pelicula> _populares = [];

  //creamos stream para las peliculas populares
  //le agregamos el broadcasts para que varias instancias puedan escuchar el stream
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  //get para insertar informacion
  //apunta al sink del stream controller para agregar peliculas
  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;
  //get para escuchar lo que emite el stream
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  //siempre debemos cerrar los streams cuando no se usen y no se creen multiples streams
  void disposeStreams(){
    //preguntamos si tiene algun valor, si lo tiene se cierra el stream
    _popularesStreamController?.close();
  }

  //metodo para retornar la lista de peliculas, sin importar la categoria que seleccionemos
  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{
      //retorna toda la respuesta http, para almacenar el resultado y no el future usamos await
      final resp = await http.get(url);
      //decodificamos la data de la respuesta y lo tranformamos en un mapa
      final decodedData = json.decode(resp.body);
      //barre cada uno de los resultados y genera la pelicula de acuerdo al modelo
      final peliculas = new Peliculas.fromJsonList(decodedData['results']);
      //print(decodedData['results']);
      //retornamos las peliculas ya mapeadas
      return peliculas.items;
    }

  //llamaremos las peliculas mas recientes
  Future<List<Pelicula>> getEnCines() async{

    //genera el url de manera sencilla, incluye https://

    final url = Uri.https(_url, '3/movie/now_playing', {
      //enviamos los parametros del mapa
      'api_key': _apiKey,
      'language': _language
    });

    return await _procesarRespuesta(url);


  }

  //llamaremos las peliculas mas recientes
  Future<List<Pelicula>> getPopulares() async{

    //si se estancargando datos se regresa un arreglo vacio, no se hace nada
    if(_cargando ) return [];
    //cuando no esta cargando es true
    _cargando = true;
    _popularesPage++;

    //print('Cargando siguientes');

    //genera el url de manera sencilla, incluye https://
    final url = Uri.https(_url, '3/movie/popular', {
      //enviamos los parametros del mapa
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);
    //mandamos todo lo que contenga la respuesta
    _populares.addAll(resp);
    //lo colocamos en el inicio con sink
    popularesSink(_populares);
    //cuand tenemos la respuesta cambiamos la respuesta a falso
    _cargando = false;
    return resp;
  }

  //usamos un future porque es una peticion con respuesta Finita(),
  Future<List<Actor>> getCast( String peliId) async{
    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });
    //esperamos la respuesta para guardarla
    final resp = await http.get(url);
    //decode toma el body y lo transforma en un mapa
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

  //llamaremos las peliculas mas recientes
  Future<List<Pelicula>> buscarPelicula(String query) async{

    final url = Uri.https(_url, '3/search/movie', {
      //enviamos los parametros del mapa
      'api_key': _apiKey,
      'language': _language,
      'query' : query,
    });

    return await _procesarRespuesta(url);


  }



}