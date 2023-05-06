import 'dart:convert';

import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/HomeDashboardModel.dart';
import '../model/ManpowerWorkersDataModel.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'manpower_shift_data_vm.dart';


class ManpowerWorkersDataVM extends BaseViewModel{


  List<Employee> employeeList = [];
  String todate="Today";
  final apiDateFormat = DateFormat('yyyy-MM-dd');
  String designationid= "";
  String apartmentid= "";
  late ManpowerShiftDataVM manpowerShiftDataVM;
  String subsubcategoryId="";
  String subSubCategoryName= "";
  @override
  initView() {

    manpowerShiftDataVM = context.read<ManpowerShiftDataVM>();
    subSubCategoryName= manpowerShiftDataVM.subSubCategoryName.toString();
    apartmentid= HiveUtils.getSession<String>(SessionKey.apartmentid,defaultValue: "");
    subsubcategoryId= HiveUtils.getSession<String>(SessionKey.apartmentid,defaultValue: "");

    designationid=HiveUtils.getSession<String>(SessionKey.designtionid,defaultValue: "");

    print(ManpowerShiftDataVM().shiftstatus.toString()+" "+manpowerShiftDataVM.todate.toString()+" "+
        manpowerShiftDataVM.fromdate.toString()+" "+ManpowerShiftDataVM().shiftstatus.toString()+" "+apartmentid+" "+designationid+"      "+subsubcategoryId);
    getHomeData();
    return super.initView();
  }

  Future<void> pickUpSelectDate(BuildContext context) async {
    final today = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now());
    if (picked != null) {
     // addDependentController.dobController.value.text = apiDateFormat.format(picked);
      todate=apiDateFormat.format(picked);
      notifyListeners();
    }
  }

  void getHomeData() {
    call(path: "manpower-employee", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      ManpowerWorkersDataModel manpowerWorkersDataModel = ManpowerWorkersDataModel.fromJson(object['data']);
      employeeList = manpowerWorkersDataModel.manpower![0].employee!;
      notifyListeners();
    },method: Method.get,isShowLoader: true,queryParameters: {
      "to_date":manpowerShiftDataVM.todate.toString(),
      "shift_id":manpowerShiftDataVM.shiftstatus.toString(),
      "category_id":manpowerShiftDataVM.manpowerSubCatId.toString(),
      // "apartment_id":apartmentid.toString(),
      "apartment_id":apartmentid.toString(),
      "designation_id":designationid,
      "subcategory_id":manpowerShiftDataVM.subsubcategoryId,
      "from_date":manpowerShiftDataVM.fromdate.toString(),

    } );
  }

}