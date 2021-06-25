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
          Title(),
          //button section
          ButtonSection(),
          //paragraph section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Dolor non eiusmod labore Lorem do adipisicing veniam. Dolor sit aute pariatur labore proident consectetur anim fugiat nisi. Ullamco anim et amet pariatur ad ex enim magna. Ea veniam ea consectetur fugiat mollit occaecat voluptate aliqua elit est nisi. Cupidatat ullamco aute ipsum elit officia aliqua enim."),
          ),
        ],
     ),
   );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
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

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 20, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomBouton(icon: Icons.call, text: "Calls",),
          CustomBouton(icon: Icons.alt_route, text: "Route",),
          CustomBouton(icon: Icons.share, text: "Share",),
        ],
      ),
    );
  }
}

class CustomBouton extends StatelessWidget {
  //por si no sabemos que tipo de icono es
  final IconData icon;
  final String text;

  const CustomBouton({
    Key key, 
    //usamos required para indicar que es obligatorio dart v2.12+
     this.icon, 
     this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.blue, size: 30),
        Container(height: 10,),
        Text(this.text, style:TextStyle(color: Colors.blue),)
      ],
    );
  }
}
