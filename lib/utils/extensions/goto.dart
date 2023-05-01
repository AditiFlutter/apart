import 'package:flutter/material.dart';

extension GoTo on BuildContext {
  //PUSH
  Future<T?> push<T>(Widget child) {
    return Navigator.of(this).push<T>(MaterialPageRoute<T>(
      builder: (context) => child,
    ));
  }

  //PUSH
  Future<T?> pushName<T>(String name, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(name,arguments: arguments);
  }

  //REPLACE
  pushReplacement(Widget child) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: (context) => child,
    ));
  }

  //REPLACE
  pushReplacementName(String name,{Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(name,arguments: arguments);
  }

  //PUSH AND REPLACE
  pushAndRemoveUntil(Widget child) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => child),
            (Route<dynamic> route) => false);
  }

  //PUSH AND REPLACE
  pushNameAndRemoveUntil(String name,{Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
        name,
            (route) => false,
        arguments: arguments
    );
  }

  //POP
  pop({Object? value}) {
    Navigator.of(
      this,
      rootNavigator: true,
    ).pop(value);
  }
}
