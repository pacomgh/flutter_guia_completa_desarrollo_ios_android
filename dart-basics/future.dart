void main() {
  print('Estamos a punto de pedir datos');
  
  //esta linea empeiza a trabajar en otro hilo y devuelve el dato despues de 4 seg
  //.then procesa cuando se resuelve el future
  httpGet('https://api.nasa.com').then( (data) {
    print(data);
  });
  
  print('Ultima linea');
}

Future<String> httpGet(String url){
  return Future.delayed( new Duration( seconds: 4), (){
    return 'Hola Mundo';
  });
}