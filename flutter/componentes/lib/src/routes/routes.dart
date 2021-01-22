import 'package:flutter/material.dart';
//rutas
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slide_page.dart';
import 'package:componentes/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){

  //definimos las rutas que usaremos
  return <String, WidgetBuilder>{
    '/'      : (BuildContext context) => HomePage(),
    //los nombres de las rutas los sacamos de nuestro archivo data/menu_opts.json
    'alert'  : (BuildContext context) => AlertPage(),
    'avatar' : (BuildContext context) => AvatarPage(),
    'card'   : (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(), 
    'inputs' : (BuildContext context) => InputPage(), 
    'slider' : (BuildContext context) => SliderPage(), 
    'list'   : (BuildContext context) => ListaPage(),
  };

}