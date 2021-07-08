import 'package:flutter/material.dart';

import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/map_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QT Reader',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage(),
        'map' : ( _ ) => MapPage()
      },
      
    );
  }
}