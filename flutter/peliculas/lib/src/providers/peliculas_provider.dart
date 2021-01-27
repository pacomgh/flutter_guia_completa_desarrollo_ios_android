import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{
  String _apiKey    = 'e025d77ce91c7b698e4af70d16ca4a4f';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  //llamaremos las peliculas mas recientes
  Future<List<Pelicula>> getEnCines() async{

    //genera el url de manera sencilla, incluye https://

    final url = Uri.https(_url, '3/movie/now_playing', {
      //enviamos los parametros del mapa
      'api_key': _apiKey,
      'language': _language
    });

    //retorna toda la respuesta http, para almacenar el resultado y no el future usamos await
    final resp = await http.get(url);
    //decodificamos la data de la respuesta y lo tranformamos en un mapa
    final decodedData = json.decode(resp.body);
    //barre cada uno de los resultados y genera la pelicula de acuerdo al modelo
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    //retornamos las peliculas ya mapeadas
    return peliculas.items;


  }

}