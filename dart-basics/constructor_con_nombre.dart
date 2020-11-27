import 'dart:convert';
//constructores con nombre
void main(){
  //final wolverine = new Hero('Logan', 'Regeneracion');
  //Json en bruto, respuesta de api
  final rawJson = '{"nombre": "Logan", "poder": "Regeneracion"}';
  //creamos json parseado, lo mandamos en un mapa para que sea preciso
  Map parsedJson = json.decode(rawJson);
  //print(parsedJson);
  
  final wolverine = new Hero.fromJson(parsedJson);
  print(wolverine.nombre);
  print(wolverine.poder);
  
  
}


class Hero{
  String nombre;
  String poder;
  
  Hero(this.nombre, this.poder);
  //Creamos el constructor . y le asignamos un nombre para crear un constructor con nombre, podemos crear una instancia de este
  Hero.fromJson(Map parsedJson){
    //asignamos a una variable lo que queremos extraer del json
    nombre = parsedJson['nombre'];
    poder  = parsedJson['poder'];
  }
  
}





