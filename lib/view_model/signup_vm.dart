import 'dart:convert';
import 'package:apart/model/SelectApartmentModel.dart';
import 'package:apart/model/SelectDesignationtModel.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/login/login_screen.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/SelectCityModel.dart';

class SignupVM extends BaseViewModel{
  bool _visible =false;
  final formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  var phoneNumber = TextEditingController();
  bool _passenable = true;
  bool _confimPass = true;
  var _countryCode = "91";
  var _countryName = "India";

  var firstnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var lastnameController = TextEditingController();
  var addressController = TextEditingController();
  List<City> selectCityList = [];
  List<Designation> selectDesignationList = [];
  List<Apartment> selectaAartmentsList = [];
  String cityId="";
  String designationId="";
  String apartmentId="";
  get countryName => _countryName;
  set countryName(value) {
    _countryName = value;
  }
  get countryCode => _countryCode;
  set countryCode(value) {
    _countryCode = value;
    notifyListeners();
  }
  bool get confimPass => _confimPass;
  set confimPass(bool value) {
    _confimPass = value;
    notifyListeners();
  }

  bool get passenable => _passenable;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }

  bool get visible => _visible;
  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }

  get autoValidate => _autoValidate;

  set autoValidate(value) {
    _autoValidate = value;
    notifyListeners();
  }

  @override
  initView() {
   // getCityData();
    //getDesignationData();
    getCityData();
    return super.initView();
  }

  void getCityData() {
    call(path: "cities", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      SelectCityModel homeDashboardModel = SelectCityModel.fromJson(object['data']);
      selectCityList = homeDashboardModel.city!;
      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }
  void getDesignationData() {
    call(path: "designation", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      SelectDesignationtModel selectDesignationtModel = SelectDesignationtModel.fromJson(object['data']);
      selectDesignationList = selectDesignationtModel.designation!;
      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }
  void getApartmentData() {
    call(path: "apartments", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      SelectApartmentModel selectApartmentModel = SelectApartmentModel.fromJson(object['data']);
      selectaAartmentsList = selectApartmentModel.apartment!;
      notifyListeners();
    },method: Method.get,isShowLoader: true,queryParameters: {
      "city_id":cityId.toString(),
    });
  }

  void submitRegistration() {
    FocusScope.of(context).unfocus();
    if(formKey.currentState!.validate()){
      call(path: "auth/register", onSuccess: (statusCode, data) {
        Map object = jsonDecode(data);
        Fluttertoast.showToast(msg:object['message'].toString());
        context.pushReplacement(const Login());
      },method: Method.post,params: {
        "email":emailController.text,
        "password":passwordController.text,
        "first_name": firstnameController.text,
        "last_name": lastnameController.text,
        "phone": phoneNumber.text,
        "address": addressController.text,
        "apartment_id": apartmentId.toString(),
        "city_id": cityId.toString(),
        "designation_id": designationId.toString(),
      });
    }else{
      autoValidate = AutovalidateMode.always;
    }
  }

}