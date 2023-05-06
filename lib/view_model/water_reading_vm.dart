import 'dart:async';
import 'dart:convert';
import 'package:apart/model/ManpowerShiftModel.dart';
import 'package:apart/model/WaterMeterModel.dart';
import 'package:apart/view/manpower/ViewModel/manpower_cat_vm.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/BescomeReadingModel.dart';
import '../model/BesomeMeterModel.dart';
import '../model/WaterReadingModel.dart';
import '../model/WaterTypeModel.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class WaterReadingVM extends BaseViewModel{
  String testt="Today";
  late BottomBarVM bottomBarVM;
  List<WaterReadings> waterReadings=[];
  List<WaterMeter>waterMeter=[];
  List<WaterType> waterType=[];
  String todate="Today";
  String fromdate="Today";
  final apiDateFormat = DateFormat('yyyy-MM-dd');
  String meterId="0",meterTypeId="";
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
    getWaterType();

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

    call(path: "water-meter", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      WaterMeterModel waterMeterModel = WaterMeterModel.fromJson(object['data']);
      waterMeter = waterMeterModel.waterMeter!;
      waterReadings.clear();
      notifyListeners();
    },
        method: Method.get,isShowLoader: true,queryParameters: {
          "apartment_id":HiveUtils.getSession<String>(SessionKey.apartmentid),
        });
  }

  void getBescomReadingData() {
    waterReadings.clear();
    notifyListeners();
    if(fromdate=="Today"){
      fromdate = apiDateFormat.format(DateTime.now());
    }

    if(todate=="Today"){
      todate = apiDateFormat.format(DateTime.now());
    }

    call(path: "water-reading", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      WaterReadingModel waterReadingModel = WaterReadingModel.fromJson(object['data']);
      waterReadings = waterReadingModel.waterReadings!;
      notifyListeners();
    },
        method: Method.get,isShowLoader: true,queryParameters: {
          "to_date":todate.toString(),
          "apartment_id":HiveUtils.getSession<String>(SessionKey.apartmentid),
          "from_date":fromdate.toString(),
          "water_meter_id":meterId.toString(),
          "type_id":meterTypeId.toString(),
        });
  }

  void getWaterType(){

    call(path: "water-type", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      WaterTypeModel waterTypeModel = WaterTypeModel.fromJson(object['data']);
      waterType = waterTypeModel.waterType!;
      waterReadings.clear();
      notifyListeners();
    },
        method: Method.get,isShowLoader: true,);
  }
  void onchange(){
    if( meterTypeId.toString()=="2")
      {
        waterMeter.clear();
        waterReadings.clear();
        notifyListeners();

      }else{
      getBescomReading();

    }


  }

}