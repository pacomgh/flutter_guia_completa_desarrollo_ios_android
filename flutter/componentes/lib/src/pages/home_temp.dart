import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  //const HomePageTemp({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Componentes teemp'),
     ),
     body: ListView(
       children: _crearItemsCorta(),
     ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {

      final tempWidget=ListTile(
        title: Text(opt),
      );

      //operador de cascada, lo usamos con .. y agregamos un nuevo add
      //con el .. hacemos referencia a la lista(regresa al operador/objeto origina,)
      lista..add(tempWidget)
           ..add(Divider(
            color: Colors.amber[900],
            height: 20.0,
            )
          );         
    }
    return lista;
  }

  List<Widget> _crearItemsCorta(){

    //el item guarda el valor de nuestro arreglo de opciones
    return opciones.map((item){
      //agrupamos todos nuestros widget en un column para retornar listile y divider
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_circle_outlined),
            trailing: Icon(Icons.arrow_drop_up),
            onTap: (){},
          ),
          Divider(
            color: Colors.blue,
            height: 20.0,
          )
        ],
      );
    //convertimos el map a una lista para que se pueda hacer el retorno del metodo  
    }).toList();
  }
}