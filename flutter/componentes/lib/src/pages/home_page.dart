import 'package:flutter/material.dart';
//providers
import 'package:componentes/src/providers/menu_provider.dart';
//utilidades
import 'package:componentes/src/utils/icono_string_util.dart';
class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    //el future builder se dibuja a si mismo, tiene tres estados
    return FutureBuilder(
      //future debe estar en lazada a lo que queremos enlazar, Cargardata
      future: menuProvider.cargarData(),
      //initial data es la informacion que va a tener al inicio mientras no se resuelva el future,
      initialData: [],
      //builder recibe una funcion con buildcontext y asyncsnapshot<future>, retorna widgetbuilder, permite dibujarlo en la pantalla
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        //se dispara en varias etapas, pidedata, obtuvodata, error
        print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );


    //return ListView(
    //  children: _listaItems(),
    //);
  }

  List<Widget> _listaItems(List<dynamic> data) {

    final List<Widget> opciones = [];

    data.forEach((opt) { 
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue, ),
        onTap: (){},
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;

  }
}