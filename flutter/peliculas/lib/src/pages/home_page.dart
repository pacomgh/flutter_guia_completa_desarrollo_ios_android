//libraries
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas(){
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //utiliza todo el espacio que encuentre a lo Largo,
      width: double.infinity,
      height: 300.0,
      child: Swiper(
        //al usar el layout debemos especificar el itemwidth
        layout: SwiperLayout.STACK,//tipo de animacion de swipe
        itemWidth: 200.0,
        itemBuilder: (BuildContext context,int index){
          return Image.network("http://via.placeholder.com/350x150",
          //para que la imagen se adapte a las dimensiones que tiene
          fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),//los puntitos de abajo
        control: new SwiperControl(),//las fechas laterales
      ),
    );
  }
}