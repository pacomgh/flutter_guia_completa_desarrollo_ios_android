//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//extendemos de changenotifier para que escuche los cambios
class UiProvider extends ChangeNotifier{

  int _selectedMenuOpt = 0;

  // ignore: unnecessary_getters_setters
  int get selectedMenuOpt{
    //return this._selectedMenuOpt;
    return _selectedMenuOpt;
  }

  // ignore: unnecessary_getters_setters
  set selectedMenuOpt(int i){
    //this._selectedMenuOpt=i;
    _selectedMenuOpt=i;
    //cuando detecta un cambio lo notifica a todos los escuchas
    notifyListeners();
  }

}