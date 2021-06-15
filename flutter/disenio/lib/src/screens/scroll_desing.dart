import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //imagen de background
          Background(),
          //contenido de la pantalla
          MainContent(),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30bad6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Hola mundo'),
        Text('Hola mundo'),
        Text('Hola mundo'),
      ],
    );
  }
}
