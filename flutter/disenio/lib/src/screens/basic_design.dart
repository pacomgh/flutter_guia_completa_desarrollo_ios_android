import 'package:flutter/material.dart';


class BasicDesignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //imagen central
          Image( image: AssetImage('assets/landscape.jpg'),),

          //title widget
          Title()
        ],
     ),
   );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('Oeschinen Lake Campground', style: TextStyle( fontWeight: FontWeight.bold),),
              Text('Kanderteg, Switzerlang', style: TextStyle(color: Colors.black45,)),
            ],
          ), 
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red,),
          Text('41')
        ],
      ),
    );
  }
}