import 'dart:convert';

import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/session_key.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/hive_utils.dart';
import '../view/bottom/bottom_screen.dart';

class LoginVM extends BaseViewModel{
  bool _rememberMe = false;
  bool _passenable = true;
  final formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool get passenable => _passenable;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe  = value;
    notifyListeners();
  }

  get autoValidate => _autoValidate;

  set autoValidate(value) {
    _autoValidate = value;
    notifyListeners();
  }

  void goHomePage() {
    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      call(path: "auth/login", onSuccess: (statusCode, data) {
        Map object = jsonDecode(data);
        HiveUtils.addSession(SessionKey.user,jsonEncode(object['data']['user']));
        HiveUtils.addSession(SessionKey.isLoggedIn, true);
        HiveUtils.addSession(SessionKey.token, object['data']['access_token'].toString());
        Fluttertoast.showToast(msg: object['data']['access_token'].toString());
        context.pushReplacement(const BottomNavigation());
      },method: Method.post,params: {
        "email":emailController.text,
        "password":passwordController.text,
      });
    }else{
      autoValidate = AutovalidateMode.always;
    }
  }


}