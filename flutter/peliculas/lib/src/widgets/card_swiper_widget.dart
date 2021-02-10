import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  //const CardSwiper({Key key}) : super(key: key);
  final List<Pelicula> peliculas;
    //required forza a que se tenga que mandar la lista de peliculas
    CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {    

    //cambia las dimensiones de la tarjeta dependiendo del tamaño del dispositivo
    //mediaquery da informacion sobre el dispositivo
    //obtenemos el tamaño del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        //al usar el layout debemos especificar el itemwidth
        layout: SwiperLayout.STACK,//tipo de animacion de swipe
        itemWidth: _screenSize.width * 0.7,//asignamos el 70% del ancho
        itemHeight: _screenSize.height * 0.5,//asignamos el 50% del alto
        itemBuilder: (BuildContext context,int index){
          //hacemos referencia al uniqueid del modelo de las peliculas
          //al uniqueid le asignamos el id de la pelicula e indicamos que venimos de la pagina de tarjeta-tarjeta
          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';

          return Hero(
            //enviamos el uniqueid de la imagen grande al detalle de las peliculas
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  child: FadeInImage(
                    image: NetworkImage( peliculas[index].getPosterImg(),
                  ), 
                  placeholder: AssetImage('assets/img/no-image.jpg')
                ),
                //enviamos como arguments peliculas[index] indicando que solo enviamos esa unica pelicula
                onTap: () => Navigator.pushNamed(context, 'detalle', arguments: peliculas[index])
              ), 
            ),
          );
        },
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),//los puntitos de abajo
        //control: new SwiperControl(),//las fechas laterales
      ),
    );
  }
}