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
          SliverList(//es como un listview
            delegate: SliverChildListDelegate(//para ordenar los widgets de manera correcta
              [
                SizedBox(height: 10.0,),
                _posterTitulo(context, pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
              ]
            ),
          ),
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

  Widget _posterTitulo(BuildContext context, Pelicula pelicula){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox( width: 20.0,),
          //este widget se adapta a todo el espacio restante del contenedor
          Flexible(
            child: Column(
              //para que queden ordenados al inicio
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis,),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text( pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula){
    return Container(
      //espacio de separacion entre elementos con el container
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}