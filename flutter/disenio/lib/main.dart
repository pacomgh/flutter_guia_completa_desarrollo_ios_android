import 'package:flutter/material.dart';

//import 'package:disenio/src/screens/scroll_page.dart';
import 'package:disenio/src/screens/basic_design.dart';
import 'package:disenio/src/screens/home_screen.dart';
import 'package:disenio/src/screens/scroll_desing.dart';
//import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //cambiamos las letras de hasta arriba de color
    //lo cambio a la barra completamente blanca
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //.copyWith(//statusBarColor: Colors.white));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        //_ indica que no nos interesa el parametro
        'basic_design':( _ ) => BasicDesignScreen(),
        'scroll_desing': (_) => ScrollScreen(),
        'home_screen': (_) => HomeScreen(),
      },      
    );
  }  
}