//de esta manera solo importamos la biblioteca rootBundle
import "package:flutter/semantics.dart" show rootBundle;
import 'package:flutter/services.dart';
import 'dart:convert';

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    //cargarData(); al tener un future async await no necesitamos llamar esto en el constructor
  }
  //future retorna una tarea a resolver en el futuro, se construye cuando termina todo el proceso del metodo
  cargarData() async{

    //cargamos el archivo json
    final resp = await rootBundle.loadString('data/menu_opts.json');//regresa un future
      
    //transformamos el string en un map
    Map dataMap = json.decode(resp);
    print(dataMap['rutas']);//imprimimos algun dato del dataMap
    //guardamos las rutas(contenido que queremos)en el arreglo
    opciones = dataMap['rutas'];

    return opciones;
  }
}

//creamos instancia del menu provider para que solo este expuesta la instancia del menu provider
final menuProvider = _MenuProvider();