import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasty {
  static showtoast(Color bg,String message, {int second = 1}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: bg,
    );
  }
}