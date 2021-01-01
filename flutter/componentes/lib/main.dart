import 'package:flutter/material.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/home_page.dart';
//pages
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      //definimos las rutas que usaremos
      //definimos cual será la ruta inicial
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/'      : (BuildContext context) => HomePage(),
        //los nombres de las rutas los sacamos de nuestro archivo data/menu_opts.json
        'alert'  : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
      },
    );
  }

  
}