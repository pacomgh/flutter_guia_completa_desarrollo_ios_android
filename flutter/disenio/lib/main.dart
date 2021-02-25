import 'package:flutter/material.dart';
import 'package:disenio/src/pages/basico_page.dart';
import 'package:disenio/src/pages/scroll_page.dart';
import 'package:disenio/src/pages/botones_page.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //cambiamos las letras de hasta arriba de color
    //lo cambio a la barra completamente blanca
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //  statusBarColor: Colors.white
    //));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //rutas
      initialRoute: 'botones',
      routes: {
        'basico':(BuildContext context) => BasicoPage(),
        'scroll':(BuildContext context) => ScrollPage(),
        'botones':(BuildContext context) => BotonesPage(),
      },      
    );
  }
}