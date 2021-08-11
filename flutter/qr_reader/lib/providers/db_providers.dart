import 'package:sqflite/sqflite.dart';

class DBProvider{

  static Database _database;
  //instanciamos la base de datos, nos servira para construir un singleton
  static final DBProvider db = DBProvider._();//._() es un constructor privado

  DBProvider._();//constructor privado

  //la manera en la que accederemos a la propiedad
  Future<Database> get database async{
    if(_database != null) return _database;
    
    _database = await initDB();

    return _database;

  }

  Future<Database> initDB() async{
    
  }


}