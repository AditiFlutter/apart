import 'dart:convert';
import 'dart:io';

import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileVM extends BaseViewModel{
  File? imageFile;

  late BottomBarVM bottomBarVM;

  @override
  initView() {
    bottomBarVM = context.read<BottomBarVM>();
    return super.initView();
  }
}