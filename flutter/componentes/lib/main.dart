import 'package:flutter/material.dart';
//pages
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
//libraries
import 'package:flutter_localizations/flutter_localizations.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
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