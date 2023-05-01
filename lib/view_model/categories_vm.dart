import 'dart:convert';

import 'package:apart/view_model/home_vm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/HomeDashboardModel.dart';
import 'base_vm.dart';

class CateogoriesVM extends BaseViewModel{
  String? categoriesPath = "";
  ScrollController scrollController = ScrollController();

  List<Categories> categoriess = [];
  late HomeVM homeVM;


  @override
  initView() {
    homeVM = context.read<HomeVM>();
    getHomeData();
    return super.initView();
  }

  void getHomeData() {
    call(path: "dashboard", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      HomeDashboardModel homeDashboardModel = HomeDashboardModel.fromJson(object['data']);

      categoriess = homeDashboardModel.categories!;

      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }

}