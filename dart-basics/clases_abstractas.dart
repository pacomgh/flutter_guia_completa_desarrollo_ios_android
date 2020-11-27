void main() {
  //las clases abstractas no se crear con new, se implementan en otra clase y de esa clase se crea el objeto
  //final perro = new Animal();
  //una vez que hemos creado las clases e implementado la clase abstracta creamos el objeto de esa clase
  final perro = new Perro();
  perro.emitirSonido();
  
  final gato = new Gato();
  gato.emitirSonido();
  
}

//creamos una clase abstracta con la palabra reservada abstract
abstract class Animal{
  int patas;
  void emitirSonido();
}
//para usar la clase abstracta usamos implements en la clase que la queremos usar
class Perro implements Animal{
  //debe tener los atributos y metodos de la clase abstracta
  int patas;
  //se pueden agregar mas metodos y atributos
  int colas;
  
  void emitirSonido()=> print('GUAAAUU!!');  
}

class Gato implements Animal{
  int patas;
  void emitirSonido()=>('Miaaaauuu!!!');
}