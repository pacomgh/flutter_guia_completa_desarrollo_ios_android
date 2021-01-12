import 'package:flutter/material.dart';
//pages
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),      
      //definimos cual será la ruta inicial
      initialRoute: '/',
      //creamos un metodo para cuando no se encuentra una ruta rediriga a algun lugar
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings setting) { 

        print('Ruta llamada ${ setting.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
          ,
        );
        
      },
    );
  }
  
}