import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  String seleccion="";

  final peliculas = [
    'Spiderman',
    'Shazam',
    'Avengers',
    'Capitan America',
    'Iron Man',
    'Iron Man 2',
    'Iron Man 3',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitan America'
  ];

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
      return Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blueAccent,
          child: Text(seleccion),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {

      final listaSugerida = ( query.isEmpty )//si el query esta vacio, enviamos peliculas recientes
                            ? peliculasRecientes
                            : peliculas.where(//sino seleccionamos la pelicula en donde inicie el nombre de
                              (p) => p.toLowerCase().startsWith(query.toLowerCase())//la pelicula con el query escrito
                            ).toList();//lo regresamos en una lista

    // Son las sugerenias que aparecen al escribir
    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context,i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  }

}