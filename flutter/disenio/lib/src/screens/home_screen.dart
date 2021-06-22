import 'package:flutter/material.dart';

import 'package:disenio/widgets/background.dart';
import 'package:disenio/widgets/page_title.dart';
import 'package:disenio/widgets/custom_bottom_navigation.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          //backgorund
          Background(),
          _HomeBody(),
        ]
     ),
     //bottom navigation bar
     bottomNavigationBar: CustomBottomNavigation()
   );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //titulos
          PageTitle(),
        ],
      ),           
    );
  }
}