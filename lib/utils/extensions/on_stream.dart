import 'dart:convert';

import '../../model/UserModel.dart';


extension OnString on String{

  UserModel userModel(){
    return UserModel.fromJson(json.decode(this));
  }
}