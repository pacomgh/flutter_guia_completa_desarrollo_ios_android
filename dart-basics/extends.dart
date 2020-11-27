void main() {
  //una clase abstracta tambien puede ser extendida por otras clases
  //extends, una clase extiende todos los atributos y metodos de una clase
  
  final superman = new Heroe();
  superman.nombre = 'Clark Kent';
  
  final luthor = new Villano();
  luthor.nombre = 'Lex Luthor';
  
  print(superman.nombre);
  print(luthor.nombre);
  
}

abstract class Personaje{
  //una de las ventajas es que si en un futuro quiero agregar metodos o atributos se pueden usar desde las clases utilizan la herencia sin necesidad de modificar estas ultimas
  String nombre;
  String poder;
}

class Heroe extends Personaje{
  int valentia;
}

class Villano extends Personaje{
  int maldad;
}
