import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/material.dart';

class SignupVM extends BaseViewModel{
  bool _visible =false;
  final formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  var phoneNumber = TextEditingController();
  bool _passenable = true;
  bool _confimPass = true;
  var _countryCode = "91";
  var _countryName = "India";

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  get countryName => _countryName;

  set countryName(value) {
    _countryName = value;
  }

  get countryCode => _countryCode;

  set countryCode(value) {
    _countryCode = value;
    notifyListeners();
  }

  bool get confimPass => _confimPass;

  set confimPass(bool value) {
    _confimPass = value;
    notifyListeners();
  }

  bool get passenable => _passenable;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }

  bool get visible => _visible;

  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }

  get autoValidate => _autoValidate;

  set autoValidate(value) {
    _autoValidate = value;
    notifyListeners();
  }
  //
  // void goToRegister() {
  //   if(formKey.currentState!.validate()){
  //     call(path: "register", onSuccess: (statusCode, data) {
  //       context.pushReplacement(Login());
  //     },method: Method.post,params: {
  //       "name":nameController.text,
  //       "country":countryName,
  //       "phone":phoneNumber.text,
  //       "email":emailController.text,
  //       "password":passwordController.text,
  //       "firebase_token":passwordController.text,
  //     });
  //   }else{
  //     autoValidate = AutovalidateMode.always;
  //   }
  // }
}