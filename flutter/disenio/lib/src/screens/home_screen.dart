import 'package:flutter/material.dart';

import 'package:disenio/widgets/background.dart';
import 'package:disenio/widgets/card_table.dart';
import 'package:disenio/widgets/custom_bottom_navigation.dart';
import 'package:disenio/widgets/page_title.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          //backgorund
          Background(),
          //home body
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
          //tabla de botones tipo card
          CardTable(),
        ],
      ),           
    );
  }
}