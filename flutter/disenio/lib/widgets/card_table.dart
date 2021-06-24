import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(//todos los tablerow tienen que tener la misma cantidad de hijos
        children: [
          _SingleCard(
            color: Colors.blue,
            iconData: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            iconData: Icons.car_rental,
            text: 'Transport',
          )
        ]
      ),
      TableRow(//todos los tablerow tienen que tener la misma cantidad de hijos
        children: [
          _SingleCard(
            color: Colors.purple,
            iconData: Icons.close,
            text: 'Cerrado',
          ),
          _SingleCard(
            color: Colors.red,
            iconData: Icons.cloud,
            text: 'nube',
          )
        ]
      ),
      TableRow(//todos los tablerow tienen que tener la misma cantidad de hijos
        children: [
          _SingleCard(
            color: Colors.yellowAccent,
            iconData: Icons.storage,
            text: 'storage',
          ),
          _SingleCard(
            color: Colors.orange,
            iconData: Icons.ac_unit,
            text: 'unit',
          )
        ]
      ),
    ]);
  }
}

class _SingleCard extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key,
      required this.iconData,
      required this.color,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: this.color,
              child: Icon(
                this.iconData,
                size: 45,
              ),
              radius: 30),
          SizedBox(height: 10),
          Text(
            this.text,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          )
        ],
      ),
    );
  }
}
