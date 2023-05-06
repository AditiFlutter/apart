import 'dart:convert';

import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/session_key.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/hive_utils.dart';
import '../view/bottom/bottom_screen.dart';

class OTPVM extends BaseViewModel{
  bool _rememberMe = false;
  bool _passenable = true;
  final formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.always;
  String otp="";
  String loginotp="";
  String userid="";
  bool get passenable => _passenable;
  @override
  initView() {
    loginotp= HiveUtils.getSession<String>(SessionKey.otp,defaultValue: "");
    userid= HiveUtils.getSession<String>(SessionKey.userid,defaultValue: "");
    return super.initView();
  }

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

  void otpRequest() {
    FocusScope.of(context).unfocus();
    if(otp.isNotEmpty&& otp==loginotp){
      call(path: "auth/validate-otp", onSuccess: (statusCode, data) {
        Map object = jsonDecode(data);
        HiveUtils.addSession(SessionKey.user,jsonEncode(object['data']['user']));
        HiveUtils.addSession(SessionKey.isLoggedIn, true);
        HiveUtils.addSession(SessionKey.token, object['data']['access_token'].toString());
        HiveUtils.addSession(SessionKey.apartmentid,object['data']['user']['apartment'][0]['id'].toString());
        HiveUtils.addSession(SessionKey.designtionid,object['data']['user']['designation']['id'].toString());
      //  Fluttertoast.showToast(msg: object['data']['access_token'].toString());
        context.pushReplacement(const BottomNavigation());
      },method: Method.post,params: {
        "otp":loginotp.toString(),
        "user_id":userid.toString(),
      });
    }else{
      Fluttertoast.showToast(msg:"PLease Enter Otp");
    }
  }


}