import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  //const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1()
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Este es la descripcion de la tarjeta de prueba de lo que queremos hacer y que se veea en la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );

  }

}


/*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          //hacemos un navigator pop del context para regresar a la pantalla anterior
          Navigator.pop(context);
        },
      ),*/