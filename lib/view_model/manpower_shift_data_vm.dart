import 'dart:async';
import 'dart:convert';
import 'package:apart/model/ManpowerShiftModel.dart';
import 'package:apart/view/manpower/ViewModel/manpower_cat_vm.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class ManpowerShiftDataVM extends BaseViewModel{

  late BottomBarVM bottomBarVM;
  List<Manpower> manpowerShifDataList = [];
  List<Employee> manpowerEmployeeShifDataList = [];
  String todate="Today";
  String fromdate="Today";
  String shiftstatus="3";
  final apiDateFormat = DateFormat('yyyy-MM-dd');
  String catname= "";
  String apartmentid= "";
  String subsubcategoryId="";
  final _myVariableController = StreamController<String>.broadcast();
  Stream<String> get myVariableStream => _myVariableController.stream;
  late ManpowerCatVm manpowerCatVm;
  String manpowerSubCatId="";
  // Method to update myVariable
  void updateMyVariable(String newValue) {
    shiftstatus = newValue;
    _myVariableController.add(shiftstatus);
    getWorkershiftData();
  }

  // Dispose the StreamController when no longer needed
  @override
  void dispose() {
    _myVariableController.close();
    super.dispose();
  }
  // The variable that needs to be listenable
  //String myVariable = '';
  @override
  initView() {
    //bottomBarVM = context.read<BottomBarVM>();
   // getWorkershiftData();
    manpowerCatVm = context.read<ManpowerCatVm>();
    manpowerSubCatId= manpowerCatVm.manpowerSubCatId.toString();

    catname= HiveUtils.getSession<String>(SessionKey.catid,defaultValue: "");
    apartmentid= HiveUtils.getSession<String>(SessionKey.apartmentid,defaultValue: "");
    updateMyVariable('1');


    return super.initView();
  }

  // 0 for fromdate and 1 for Todate

  Future<void> pickUpSelectDate(BuildContext context, int status) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now());
    if (picked != null) {
     // addDependentController.dobController.value.text = apiDateFormat.format(picked);
      if(status==0){
        fromdate=apiDateFormat.format(picked);
        getWorkershiftData();
      }else{
        todate=apiDateFormat.format(picked);
        getWorkershiftData();
      }

      notifyListeners();
    }
  }

  void getWorkershiftData() {
    manpowerShifDataList.clear();
    if(fromdate=="Today"){
      fromdate = apiDateFormat.format(DateTime.now());
    }

    if(todate=="Today"){
      todate = apiDateFormat.format(DateTime.now());
    }

    call(path: "manpowers", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      ManpowerShiftModel manpowerShiftModel = ManpowerShiftModel.fromJson(object['data']);
      manpowerShifDataList = manpowerShiftModel.manpower!;

      notifyListeners();
    },
        // method: Method.get,params: {
        //   "email":emailController.text,
        //   "password":passwordController.text,
        // }
        method: Method.get,isShowLoader: true,queryParameters: {
          "to_date":todate.toString(),
          "shift_id":shiftstatus.toString(),
          "category_id":manpowerCatVm.manpowerSubCatId.toString(),
          "apartment_id":apartmentid.toString(),
          "from_date":fromdate.toString(),
        });
  }

}