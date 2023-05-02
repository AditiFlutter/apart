import 'dart:async';
import 'dart:convert';
import 'package:apart/model/ManpowerShiftModel.dart';
import 'package:apart/view/manpower/ViewModel/manpower_cat_vm.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/BescomeReadingModel.dart';
import '../model/BesomeMeterModel.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class BaseComReadingVM extends BaseViewModel{
  String testt="Today";
  late BottomBarVM bottomBarVM;
  List<BescomMeter> bescomMeter=[];
  List<BescomReadings> bescomReadings=[];
  String todate="Today";
  String fromdate="Today";
  final apiDateFormat = DateFormat('yyyy-MM-dd');
  String meterId="";
  // Method to update myVariable

  // Dispose the StreamController when no longer needed
  @override
  void dispose() {
    super.dispose();
  }
  // The variable that needs to be listenable
  //String myVariable = '';
  @override
  initView() {
    getBescomReading();
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
        getBescomReadingData();
      }else{
        todate=apiDateFormat.format(picked);
        getBescomReadingData();
      }

      notifyListeners();
    }
  }
  void getBescomReading(){

    call(path: "bescom-meter", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      BescomMeterModel bescomMeterModel = BescomMeterModel.fromJson(object['data']);
      bescomMeter = bescomMeterModel.bescomMeter!;
      bescomReadings.clear();
      notifyListeners();
    },
        method: Method.get,isShowLoader: true,queryParameters: {
          "apartment_id":HiveUtils.getSession<String>(SessionKey.apartmentid),
        });
  }

  void getBescomReadingData() {
    bescomReadings.clear();
    notifyListeners();
    if(fromdate=="Today"){
      fromdate = apiDateFormat.format(DateTime.now());
    }

    if(todate=="Today"){
      todate = apiDateFormat.format(DateTime.now());
    }

    call(path: "bescom-reading", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      BescomReadingModel bescomReadingModel = BescomReadingModel.fromJson(object['data']);
      bescomReadings = bescomReadingModel.bescomReadings!;
      notifyListeners();
    },
        method: Method.get,isShowLoader: true,queryParameters: {
          "to_date":todate.toString(),
          "apartment_id":HiveUtils.getSession<String>(SessionKey.apartmentid),
          "from_date":fromdate.toString(),
          "meter_id":meterId.toString(),
        });
  }

}