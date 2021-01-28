import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
//es un stateless porque es responsabilidad del padre enviar la Informacion,
class MovieHorizontal extends StatelessWidget {
  //const MovieHorizontal({Key key}) : super(key: key);

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    //obtenemos el tamaño de la pantalla
    final _screenSize = MediaQuery.of(context).size;
    //container se usa para manejar la separacion
    return Container(
      height: _screenSize.height*0.2,//obtenemos el 20%
      //sirve para deslizar widgets o paginas
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,//hace que sea fluido
          viewportFraction: 0.3//cuantas tarjetas se muestran en el viewport
        ),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
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