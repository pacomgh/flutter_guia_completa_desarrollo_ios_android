import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro appbar
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            //lo que la persona escriba se guarda en el query
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), 
        onPressed: (){
          //para regresar a la pantalla anterior
          close(context,null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Crea los resultados que vamos a buscar
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Son las sugerenias que aparecen al escribir
    return Container();
  }

}