import 'dart:convert';

import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/session_key.dart';
import 'package:apart/view/otp/otp_screen.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/cupertino.dart';
import '../utils/hive_utils.dart';
import '../view/bottom/bottom_screen.dart';

class LoginVM extends BaseViewModel{
  bool _rememberMe = false;
  bool _passenable = true;
  final formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.always;
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
        if(object['data']['otp'].toString()==""){
          HiveUtils.addSession(SessionKey.user,jsonEncode(object['data']['user']));
          HiveUtils.addSession(SessionKey.isLoggedIn, true);
          HiveUtils.addSession(SessionKey.token, object['data']['access_token'].toString());
          HiveUtils.addSession(SessionKey.userid,object['data']['user']['id'].toString());
          HiveUtils.addSession(SessionKey.apartmentid,object['data']['user']['apartment'][0]['id'].toString());
          HiveUtils.addSession(SessionKey.designtionid,object['data']['user']['designation']['id'].toString());
          context.pushReplacement(const BottomNavigation());
        }else{
          HiveUtils.addSession(SessionKey.otp, object['data']['otp'].toString());
          HiveUtils.addSession(SessionKey.userid,object['data']['user']['id'].toString());
          context.pushReplacement(const OTP());
        }

      },method: Method.post,params: {
        "email":emailController.text,
        "password":passwordController.text,
      });
    }else{
      autoValidate = AutovalidateMode.always;
    }
  }


}