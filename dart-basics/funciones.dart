void main() {
  final wolverine = new Heroe(poder: 'Regeneracion', nombre: 'Logan');

  print(wolverine);
}

class Heroe {
  String nombre;
  String poder;

  //cuando mandamos parametros asignados a nombre, podemos definir un valor por default para que no aparezca null
  /*Heroe({String nombre = 'Sin nombre', String poder}) {
    this.nombre = nombre;
    this.poder = poder;
  }*/
  //este tipo de argumentos son argumentos posicionales
  Heroe({this.nombre, this.poder});

  //metodo es dentro de la clase, funcion es fuera de la clase
  //String toString() {
    //podemos asignar estos parametros sin this y sin {}
    //la interpolacion en dart se hace con comillas simples ''
    //return '${this.nombre} - ${this.poder}';
  //}
  String toString() => 'nombre: $nombre - poder: $poder';
}
