import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

// _ indica que es privado
class ContadorPage extends StatefulWidget{
  //debemos hacer la implementacion del create state, retorna una instancia del estado de abajo
  @SemanticsHintOverrides()
  createState() => _ContadorPageState();
}

//solo se utiliza en esta clase, el state debe ser del tipo de la clase<T>
class _ContadorPageState extends State<ContadorPage>{

  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;
  
  @override
  Widget build(BuildContext context) {//el metodo build lo usamos cuando queremos redibujar el widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        elevation: 15.0,
      ),
      body: Center(
        //la mayoria de widgets solo pueden tener un child
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de taps: ', style: _estiloTexto,),
            Text('$_conteo', style: _estiloTexto,)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  //creamos un metodo para que el codigo del build no se haga largo y dificil de leer
  Widget _crearBotones(){
    return Row(
      //mainaxisaligment sirve para alinear los widgets respecto a alguna posicion
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton( child: Icon(Icons.exposure_zero),onPressed: _reset,),
        //agregamos una separacion con sizedbox, expanded toma todo el espacio disponible dentro del widget padre
        Expanded(child: SizedBox(width: 5.0,)),
        FloatingActionButton( child: Icon(Icons.remove),onPressed: _sustraer,),
        SizedBox(width: 5.0,),
        //no se pone parentesis en el onpressed porque si se ponen se ejecutaria el metodo en el momento en que se cree el widget
        FloatingActionButton( child: Icon(Icons.add),onPressed: _agregar,),        
      ],
    );    
  }

  //separamos los metodos que usaremos en los botones para que el codigo no crezca y no se pueda leer
  void _agregar(){
    setState (() => _conteo++);
  }

  void _sustraer(){
    setState (() => _conteo--);
  }

  void _reset(){
    setState (() => _conteo=0);
  }
}