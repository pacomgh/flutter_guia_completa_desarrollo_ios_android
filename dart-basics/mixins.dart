void main() {
  final pato = new Pato();
  pato.volar();
  
  final pezVolador = new PezVolador();
  pezVolador.nadar();
}

abstract class Animal{}

abstract class Mamifero extends Animal{}

abstract class Ave extends Animal{}

abstract class Pez extends Animal{}

//creammos las clases que permiten mezclarlo/mixins
//en dart podemos usar clases abstractas como mixins
abstract class Volador{
  void volar() => print('Estoy Volando');
}

abstract class Nadador{
  void nadar() => print('Estoy Nadando');
}

abstract class Caminante{
  void caminar() => print('Estoy Caminando');
}

//creamos unos animales
//hacemos uso del mixin con la palabra with
class Delfin extends Mamifero with Nadador{}

//cuando queremos usar dos o mas mixins los separamos con ,
class Murcielago extends Mamifero with Volador, Caminante{}

class Gato extends Mamifero with Caminante{}

class Paloma extends Ave with Caminante, Volador{}

class Pato extends Ave with Caminante, Volador, Nadador{}

class Tiburon extends Pez with Nadador{}

class PezVolador extends Pez with Nadador, Volador{}




