import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre="";
  String _email="";
  String _password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(//elegimos listview porque al escribir se desplaza con el teclado
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
        children: <Widget>[
          _crearInput(),          
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(//trabaja de manera independiente al textformfield
      //autofocus: true,//le hace focus cuando entramos a la pagina
      textCapitalization: TextCapitalization.sentences,//capitaliza cada palabra
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),//contador de caracteres
        hintText: 'Nombre de la persona',//texto de sugerencia 
        labelText: 'Nombre',//etiqueta del input
        helperText: 'Solo es el nombre',//texto de ayuda para llenar input
        suffixIcon: Icon(Icons.accessibility),//icono que aparece dentro del input
        icon: Icon(Icons.account_circle),//icono del input text, a la izq        
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;          
        });
      },
    );

  }

  Widget _crearEmail() {
    return TextField(//trabaja de manera independiente al textformfield
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',//texto de sugerencia 
        labelText: 'Email',//etiqueta del input
        suffixIcon: Icon(Icons.alternate_email),//icono que aparece dentro del input
        icon: Icon(Icons.email),//icono del input text, a la izq        
      ),
      onChanged: (valor) => setState(() {
          _email = valor;          
      })    
    );
  }

  Widget _crearPassword(){
    return TextField(//trabaja de manera independiente al textformfield
      obscureText: true,
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',//texto de sugerencia 
        labelText: 'Password',//etiqueta del input
        suffixIcon: Icon(Icons.lock_open),//icono que aparece dentro del input
        icon: Icon(Icons.lock),//icono del input text, a la izq        
      ),
      onChanged: (valor) => setState(() {
          _email = valor;          
      })    
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email $_email'),
    );
  }

  
}