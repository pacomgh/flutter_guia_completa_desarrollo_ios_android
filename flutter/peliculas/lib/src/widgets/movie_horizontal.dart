import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
//es un stateless porque es responsabilidad del padre enviar la Informacion,
class MovieHorizontal extends StatelessWidget {
  //const MovieHorizontal({Key key}) : super(key: key);

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,//hace que sea fluido
    viewportFraction: 0.3//cuantas tarjetas se muestran en el viewport
  );

  @override
  Widget build(BuildContext context) {
    //obtenemos el tamaño de la pantalla
    final _screenSize = MediaQuery.of(context).size;
    //obtenemos la posicion en pixeles del pagecontroller
    _pageController.addListener(() { 
      //verificamos que el scroll sea menor que el scroll maximo
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    //container se usa para manejar la separacion
    return Container(
      height: _screenSize.height*0.2,//obtenemos el 20%
      //sirve para deslizar widgets o paginas
      child: PageView(
        pageSnapping: false,//da mejor flujo
        controller: _pageController,
        children:_tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context){
    //returna una nueva lista o iterable que se puede transformar en lista de widgets
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
}