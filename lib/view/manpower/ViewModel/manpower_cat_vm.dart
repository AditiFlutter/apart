import 'dart:convert';



import 'package:apart/model/ManpowerShiftModel.dart';
import 'package:apart/utils/session_key.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:apart/view_model/manpower_shift_data_vm.dart';
import 'package:provider/provider.dart';

import '../../../model/ManpowerCatModel.dart';
import '../../../utils/hive_utils.dart';



class ManpowerCatVm extends BaseViewModel{

  late BottomBarVM bottomBarVM;
  String manpowerSubCatId="";

  List<Categories> manpowerCatList = [];



  @override
  initView() {

    getCatData();



    return super.initView();
  }

  void getCatData() {
    manpowerCatList.clear();

    call(path: "categories", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      ManpowerCatModel manpowerCatModel = ManpowerCatModel.fromJson(object['data']);
      manpowerCatList = manpowerCatModel.categories!;


      notifyListeners();
    },method: Method.get,isShowLoader: true);


  }

}