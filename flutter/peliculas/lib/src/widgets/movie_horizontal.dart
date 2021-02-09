import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
//es un stateless porque es responsabilidad del padre enviar la Informacion,
class MovieHorizontal extends StatelessWidget {
  //const MovieHorizontal({Key key}) : super(key: key);

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
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
      child: PageView.builder(//usamos el builder para que renderice conforme sea necesario
        pageSnapping: false,//da mejor flujo
        controller: _pageController,
        //children:_tarjetas(context),
        //especificamos cuantos items tiene que renderizar
        itemCount: peliculas.length,
        itemBuilder: (context, i) => _tarjeta(context, peliculas[i]),
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

  Widget _tarjeta(BuildContext context, Pelicula pelicula){
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Expanded(
            //envolvemos el cliprrect porque es el contenedor de la imagen
            child: Hero(
              //debemos darle un id que sea unico, usamos el id de la pelicula
              tag: pelicula.id,
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

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        print('titutlo de la pelicula ${ pelicula.title }');
        //el routename es el nombre que pusimos en el main en routes
        //podemos mandar arguments, mandamos el objeto pelicula como argumento
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}