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
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
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

  Widget _cardTipo2(){
    final card = Container(
      //ayuda a que el contenido no se salga de la card
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          //fadeinimage nos sirve para cargar imagenes de la web, podemos agregar una imagen de cargando
          FadeInImage(
            image: NetworkImage('https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),//imagen de carga
            fadeInDuration: Duration(milliseconds: 200),//duracion de la transicion
            height: 300,
            fit: BoxFit.cover,//indica como la imagen debe ocupar el espacio que tiene asignado
          ),
          /*Image(
            image: NetworkImage('https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Hola soy un texto')
          )
        ],
      ),
    );

    return Container(//el container tiene ancho y alto del tamaño del contenido
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,//color de la sombra
            blurRadius: 10.0,//expansion de la sombra
            spreadRadius: 2.0,//que tanto queremos que se extienda
            offset: Offset(2.0, 10.0),//posicion de la sombra en x,y(es un plano cartesiano invertido)
          )
        ]
      ),
      child: ClipRRect(//corta lo que se encuentra fuera del contenedor
        borderRadius: BorderRadius.circular(30.0),
        child: card,//llamamos a nuestra variable card
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