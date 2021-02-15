import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{

  String seleccion="";
  final peliculasProvide = new PeliculasProvider();

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

      if(query.isEmpty){
        return Container();
      }

      return FutureBuilder(
        future: peliculasProvide.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if(snapshot.hasData){
            final peliculas = snapshot.data;
            return ListView(//aqui mostraremos la data que es regresada
            //convertimos el arreglo de peliculas en un arreglo
              children: peliculas.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'), 
                    image: NetworkImage(pelicula.getPosterImg()),
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                    //cerramos la busqueda
                    close(context, null);
                    //hacemos que el uniqueid sea nulo para que no marque error al recibir el tag del hero
                    pelicula.uniqueId = '';
                    //navegamos hacia la pagina de la descripcion
                    Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                  },
                );
              }).toList(),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }



  /*@override
    Widget buildSuggestions(BuildContext context) {

      final listaSugerida = ( query.isEmpty )//si el query esta vacio, muestra las peliculas recientes
                            ? peliculasRecientes
                            : peliculas.where(//sino seleccionamos la pelicula del query escrito
                              (p) => p.toLowerCase().startsWith(query.toLowerCase())//la pelicula que inicie con el query escrito
                            ).toList();//lo regresamos en una lista porque regresa un iterable

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
  }*/

}