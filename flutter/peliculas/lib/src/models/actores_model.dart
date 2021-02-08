//creamos una instancia de la clase para que reciba a todos los actores y mapearlos
class Cast{
  List<Actor> actores = [];

  //recbimos la lista del cast
  Cast.fromJsonList( List<dynamic> jsonList){
    //poner solo el return hace que salga del if sin hacer nada
    if(jsonList == null) return;

    //recorremos la lista de actores jsonlist para obtener cada uno de los elementos que contiene
    jsonList.forEach((item) { 

      final actor = Actor.fromJsonMap(item);
      //agregamos el actor a la lista de actores de arriba
      actores.add(actor);
    });
  }
}


class Actor{
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath
  });

  //asignamos cada propiedad del mapa a cada una de la clase
  //recibimos string, dynamic porque el primero es la llave y el valor varia en cada campo
  Actor.fromJsonMap( Map<String, dynamic> json){
    castId      = json['cast_id'];
    character   = json['character'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
  }


  getFoto(){

    if(profilePath==null)
      return 'https://r9b7u4m2.stackpathcdn.com/prod/sites/eXfkOOiYH-uoddxClSi52viuasTF1mJ8olZ0u-tOtfFqK66gZCc90Ly_Uoc0VmR1eULwQ0uGf2JhPt4yPTts8A/themes/base/assets/images/avatar-1.png';
    else
      return 'https://image.tmdb.org/t/p/w500$profilePath;
  }


}