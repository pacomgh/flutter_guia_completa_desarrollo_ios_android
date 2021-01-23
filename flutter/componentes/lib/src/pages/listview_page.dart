import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  //ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  //nos permite controlar el scroll a voluntad
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading=false;

  //metodo que inicializa la clase state
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {//se dispara cada que se mueve el scroll
    //comparamos la posicion del scroll con la posicion maxima del scroll para hacer algo|
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //cuando estoy al final de la pagina agregamos 10
        //_agregar10();
        _fetchData();
      }  
    });
  }

  @override
  void dispose() {//se dispara cuando la pagina deja de existir en el stack de paginas    
    super.dispose();
    //destruye el controller cuando se sale de la pagina actual, evitar overflow de memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Listas'),
       ),
       body: Stack(
         children:<Widget> [//aplica todo uno debajo de otro
            _crearLista(),
            _crearLoading(),
         ],
       )
    );
  }

  Widget _crearLista(){
    //listview builder se encarga de redibujar los elementos conforme sea necesario
    return RefreshIndicator(//hacemos un refresh cuando se hace pull hacia arriba
    //sin parentesis solo se para la referencia para que se ejecute cuando debe ejecutarse,
    //cuando se para con paretesis es para que se ejecute en ese momento
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        //el itembuilder es el metodo que se encarga de redibujar los elementos de la lista
        //builder refiere a la forma en como se va a dibujar ese elemento/widget
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(//lo usamos cuando tenemos que cargar imagen de recurso externo y necesitamos un loading
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      //limpiamos la lista de numeros
      _listaNumeros.clear();
      //desde el ultimo item(numero) sumamos 1 para que se agregue a la lista de numero
      _ultimoItem++;//se van a llamar nuevas imagenes
      _agregar10();//agregamos 10 nuevos elementos
    });
    //regresamos el future con delay
    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;//aumentamos el numero del item
      _listaNumeros.add(_ultimoItem);//agregamos el item a la lista
      //redibujamos el widget
      setState(() { });


    }
  }
  //somilamos un delay
  Future<Null> _fetchData() async{
    
    _isLoading=true;//esta cargando las nuevas imagenes
    setState(() {//redibujamos el widget
      
    });
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP(){
    //en este instante ya termino de cargar y lo pasamos a false
    _isLoading= false;
    //una vez que tenemos el registro movemos el scroll hacia abajo
    _scrollController.animateTo(
      //sumamos 100 pixeles para que se desplace
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,//agregamos una animacion
      duration: Duration(milliseconds: 250),//agregamos tiempo de espera
    );
    //llamamos al agregar 10
    _agregar10();
  }

  Widget _crearLoading(){

    if(_isLoading)//si esta cargardo regresamos el indicador
    return Column(
      //hacemmos que tome todo el espacio disponible de la pantalla
      mainAxisSize: MainAxisSize.max,     
      //lo alineamos al final del contenedor(este caso scaffold)
      mainAxisAlignment: MainAxisAlignment.end, 
      children: <Widget>[
        Row(
          //alieneamos al centro de la fila, centro - abajo de la pantalla
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
        SizedBox( height: 15.0,)
      ],
    );
    else//si no carga regresamo un contenedor
      return Container();

  }
}