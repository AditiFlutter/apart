import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_vm.dart';

class CateogoriesVM extends BaseViewModel{
  String? categoriesPath = "";
  ScrollController scrollController = ScrollController();
  List categories = [];


  @override
  initView() {
    return super.initView();
  }

}