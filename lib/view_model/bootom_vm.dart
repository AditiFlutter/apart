import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/material.dart';

class BottomBarVM extends BaseViewModel{
  late PageController controller;
  int currentsIndex = 0;
  int _rtl = 0;

  int get currentIndex => currentsIndex;
  int get rtl => _rtl;

  set rtl(int value) {
    _rtl = value;
    notifyListeners();
  }

  set currentIndex(int value) {
    currentsIndex = value;
    notifyListeners();
  }
  void changeTabIndex(int index) {
    currentsIndex = index;
    notifyListeners();
  }

  @override
  initView() {
    currentsIndex = 0;
    return super.initView();
  }
  @override
  disposeView() {
    controller.jumpToPage(0);
    return super.disposeView();
  }
  void setPage(int page){
    controller.jumpToPage(page);
  }


  BottomBarVM(){
    _rtl = int.tryParse("rtl") ?? 0;
    controller=  PageController(initialPage: 0);
  }

}