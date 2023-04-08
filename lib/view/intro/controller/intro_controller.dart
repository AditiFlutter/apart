import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class IntroController extends ControllerMVC  {


  GlobalKey<ScaffoldState>? scaffoldKey;

  IntroController(){
    scaffoldKey = GlobalKey<ScaffoldState>();
    notifyListeners();
  }

}
