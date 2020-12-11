import 'package:flutter/material.dart';
//podemos usar la biblioteca icon helper en un futuro

//este metodo crea un icono a partir de un string, regresa el icono de acuerdo al string que enviamos
//esta sintaxis define un mapa, <string, map>
final _icons = <String, IconData>{
  'add_alert'    : Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open'  : Icons.folder_open,
};

Icon getIcon(String nombreIcono){
  return Icon( _icons[nombreIcono], color: Colors.blue);
}

