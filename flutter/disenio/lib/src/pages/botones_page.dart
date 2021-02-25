import 'package:flutter/material.dart';

import 'dart:math';

class BotonesPage extends StatelessWidget {
  //const BotonesPage({Key key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fondoApp(){

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        //por defecto el gradiente el de forma horizontal
        gradient: LinearGradient(
          //sup-izq(0,0)/sup-der(1,0)/inf-izq(0,1)/inf-der(1,1)
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52,54,101,1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ],
        ),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 320.0,
        width: 320.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 177, 1.0)
            ]
          )
        ),
      ),
    );

    //returnamos un stack porque el gradiente y la caja rosada debe estar uno encima de otro
    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -100,
          child: cajaRosa,
        ),
      ],
    );
  }

  Widget _titulos(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify Trasaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold), ),
            SizedBox(height: 10.0,),
            Text('Classify this transaction in a particular category', style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}