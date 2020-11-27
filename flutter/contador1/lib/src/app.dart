import 'package:flutter/material.dart';

//import 'package:contador1/src/pages/home_page.dart';
import 'package:contador1/src/pages/contador_page.dart';


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //quitar el banner
      debugShowCheckedModeBanner: false,
      home: Center(
        //child: HomePage()
        child: ContadorPage(),
      ),
    );
    //throw UnimplementedError();
  }
}