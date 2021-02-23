import 'package:flutter/material.dart';
import 'package:disenio/src/pages/basico_page.dart';
import 'package:disenio/src/pages/scroll_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //rutas
      initialRoute: 'scroll',
      routes: {
        'basico':(BuildContext context) => BasicoPage(),
        'scroll':(BuildContext context) => ScrollPage(),
      },      
    );
  }
}