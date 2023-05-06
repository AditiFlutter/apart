import 'dart:convert';
import 'dart:io';

import 'package:apart/Constant/app_colors.dart';
import 'package:apart/constant/Toasty.dart';
import 'package:apart/model/ProfileModel.dart';
import 'package:apart/view/login/login_screen.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../utils/session_key.dart';
import 'package:apart/utils/hive_utils.dart';
import 'package:apart/utils/extensions/goto.dart';

class ProfileVM extends BaseViewModel{
  File? imageFile;
  late profileModel profilemodel;

  late BottomBarVM bottomBarVM;

  @override
  initView() {
    getProfileData();
    bottomBarVM = context.read<BottomBarVM>();
    return super.initView();
  }
  void logOut() {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text("Logout",style:TextStyle(fontSize:14)),
        contentPadding: const EdgeInsets.only(left: 20,top: 10,right: 5),
        content: const Text(
          "are you sure you won't logout?",style:TextStyle(fontSize:12),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          MaterialButton(
            elevation: 0,
            child: const Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop();
              getLogout();

            },
          ),
          MaterialButton(
            elevation: 0,
            child: const Text("No"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  void getLogout() {
    call(path: "logout", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      Toasty.showtoast(colorGreen, object['message']);
      HiveUtils.addSession(SessionKey.isLoggedIn, false);
      HiveUtils.clear();
      context.pushAndRemoveUntil(const Login());
      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }

  void getProfileData() {
    call(path: "profile", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
       profilemodel = profileModel.fromJson(object['data']);
      //print("nameeee"+profilemodel.user!.name.toString());

      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }
}