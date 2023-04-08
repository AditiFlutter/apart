import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/hive_utils.dart';
import 'package:apart/utils/session_key.dart';
import 'package:apart/view/intro/intro_screens.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../bottom/bottom_screen.dart';

class SplashController extends ControllerMVC {
  GlobalKey<ScaffoldState>? scaffoldKey;


  SplashController(){
    scaffoldKey = GlobalKey<ScaffoldState>();
    checkIsLogin();
  }

  void checkIsLogin() async {
    Future.delayed(const Duration(seconds: 2),
        () {
          if(HiveUtils.getSession<bool>(SessionKey.isLoggedIn,defaultValue: false)){
            scaffoldKey!.currentContext!.pushReplacement(BottomNavigation());
          }else{
            scaffoldKey!.currentContext!.pushReplacement(IntroScreen());
          }
        });
  }
}
