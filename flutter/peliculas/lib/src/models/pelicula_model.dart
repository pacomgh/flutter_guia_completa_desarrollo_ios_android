class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();
  //Este constructor nos permite recibir el map de las respuestas
  Peliculas.fromJsonList( List<dynamic> jsonList  ) {
    //no regresamos nada 
    if ( jsonList == null ) return;
    //recorremos la lista
    for ( var item in jsonList  ) {
      //mandamos un item al constructor del json map(tiene todas las propiedades que estan abajo)
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add( pelicula );
    }

  }

}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json ) {
    //dividimos entre 1 para que nos quede como double
    voteCount        = json['vote_count'];
    id               = json['id'];
    video            = json['video'];
    voteAverage      = json['vote_average'] / 1;
    title            = json['title'];
    popularity       = json['popularity'] / 1;
    posterPath       = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();//casteamos a int
    backdropPath     = json['backdrop_path'];
    adult            = json['adult'];
    overview         = json['overview'];
    releaseDate      = json['release_date'];
  }

  getPosterImg(){

    if(posterPath==null)
      return 'https://www.staticwhich.co.uk/static/images/products/no-image/no-image-available.png';
    else
      return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  getBackgourndImg(){

    if(posterPath==null)
      return 'https://www.staticwhich.co.uk/static/images/products/no-image/no-image-available.png';
    else
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }
}