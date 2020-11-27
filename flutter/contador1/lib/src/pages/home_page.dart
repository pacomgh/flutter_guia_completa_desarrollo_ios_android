import 'package:flutter/material.dart';

//las paginas son widgets tambien
class HomePage extends StatelessWidget{

  final estiloTexto = new TextStyle(fontSize: 25);
  final conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 15.0,
      ),
      body: Center(
        //la mayoria de widgets solo pueden tener un child
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de Clicks: ', style: estiloTexto,),
            Text('$conteo', style: estiloTexto,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          print('Hola mundo');
          //conteo = conteo+1;

        },
      ),
    );
  }

}