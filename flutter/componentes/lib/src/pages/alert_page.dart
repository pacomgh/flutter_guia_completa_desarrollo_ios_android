import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          //hacemos un navigator pop del context para regresar a la pantalla anterior
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(//siempre recibe un context
      context: context,
      barrierDismissible: true,//permite cerrar el alert pulsando fuera de
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,//adapta el tamaño al contenido interno
            children: <Widget>[
              Text('Este es el contenido de la alerta'),
              FlutterLogo( size: 100.0, )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}