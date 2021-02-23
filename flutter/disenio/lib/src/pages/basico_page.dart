import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class BasicoPage extends StatelessWidget {
  //const BasicoPage({Key key}) : super(key: key);
  final estiloTitulo = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold );
  final estiloSubtitulo = TextStyle( fontSize: 18.0, color: Colors.grey );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(//permite ocupar el notch de los telefonos
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen(){
    return Container(
      width: double.infinity,//extendemos la imagen a lo ancho cuando se hace pequeña
      child: Image(
        image: NetworkImage('https://previews.123rf.com/images/satori/satori1307/satori130700017/20812672-african-oasis-beautiful-natural-landscape.jpg'),
        fit: BoxFit.cover,//hacemos que ocupe todo el espacio posible disponible
        height: 200.0,
      ),
    );
  }

  Widget _crearTitulo(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(//ordena elementos de forma horizontal
          children: <Widget>[
            Expanded(
              child: Column(
                //el cross es vertical en las columnas
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Oasis africano', style: estiloTitulo,),
                  SizedBox(height: 7.0,),
                  Text('La sabana africana', style: estiloSubtitulo,),
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0,),
            Text('41', style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones(){
    return Row(
      //mainaxisaligment en el row es como se ordena de manera horizontal
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto){
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40.0,),
        SizedBox(height: 5.0,),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),),
      ],
    );
  }

  Widget _crearTexto(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0 ),
        child: Text('Est cillum incididunt sit aliqua quis laborum quis nisi aute sint fugiat duis elit ad. Enim consequat Lorem non duis. Voluptate amet ipsum veniam anim id elit consectetur cupidatat incididunt incididunt duis sunt laboris. Proident dolor sint ipsum aliquip officia ipsum ipsum pariatur aliqua consectetur nisi occaecat voluptate aliquip.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

}