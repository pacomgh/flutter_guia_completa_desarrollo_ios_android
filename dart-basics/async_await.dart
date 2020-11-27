//los constructores en una clase no pueden ser asincronos
//ayuda a transforma una funcion en una tarea asincrona
void main() async {
  print('Estamos a punto de pedir datos');
  
  //esta linea empeiza a trabajar en otro hilo y devuelve el dato despues de 4 seg
  //.then procesa cuando se resuelve el future
  //await espera hasta que se resuelva la tarea que esta en el async
  String data = await httpGet('https://api.nasa.com');
  
  print(data);
  
  print('Ultima linea');
}

Future<String> httpGet(String url){
  return Future.delayed( new Duration( seconds: 4), (){
    return 'Hola Mundo';
  });
}