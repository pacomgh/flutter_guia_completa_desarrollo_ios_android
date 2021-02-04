import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final no va a cambiar, recibimos y signamos el argumento enviado(objeto pelicula)
  final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      //scroolview al que le podemos poner efectos
      body: CustomScrollView(
        slivers: <Widget>[//slivers son una coleccion de widgets
          _crearAppbar(pelicula),
        ],
      ),
    );
  }

  Widget _crearAppbar(Pelicula pelicula){
    //este appbar lo que hace es que le damos un tamaño y cuando desplazamos hacia abajo este
    //se hace pequeño y adapta al tamaño del titulo de la pelicula que hemos asignado
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,//tamaño del appbar expandido
      floating: false,
      pinned: true,//para que se mantenga visible cuand se haga scroll
      flexibleSpace: FlexibleSpaceBar(//este widget se adapta al tamaño de la caja
        centerTitle: true,//centramos el titulo
        title: Text(
          pelicula.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),        
        ),
        //siempre usamos un background
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgourndImg()),
          placeholder: AssetImage('assets/img/loading.gif'),//cargamos nuestra imagen de carga
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,//hacemos que se adapte al contenedor
        ),
      ),
    );
  }
}