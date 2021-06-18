import 'package:flutter/material.dart';
import 'package:disenio/widgets/background.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          //backgorund
          Background(),
        ]
     ),
   );
  }
}