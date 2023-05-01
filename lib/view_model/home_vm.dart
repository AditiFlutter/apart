import 'dart:convert';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:provider/provider.dart';
import '../model/HomeDashboardModel.dart';
import '../model/SelectApartmentModel.dart';

class HomeVM extends BaseViewModel{

  late BottomBarVM bottomBarVM;
  List<Services> services = [];
  List<Categories> categories = [];
  List<Categories> categoriesForNextPage = [];
  String water_reading_value="";
  String water_reading_unit="";
  String bescon_reading_value="";
  String bescon_reading_unit="";
  String dg_reading_value="";
  String dg_reading_unit="";
  late HomeDashboardModel homeDashboardModel;



  @override
  initView() {
    bottomBarVM = context.read<BottomBarVM>();
    getHomeData();

    return super.initView();
  }

  void getHomeData() {
    call(path: "dashboard", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
       homeDashboardModel = HomeDashboardModel.fromJson(object['data']);
      services = homeDashboardModel.services!;
      categories = homeDashboardModel.categories!;
      water_reading_value= homeDashboardModel.waterReading!.value!;
      water_reading_unit= homeDashboardModel.waterReading!.unit!;
      bescon_reading_value= homeDashboardModel.bescomReading!.value!;
      bescon_reading_unit= homeDashboardModel.bescomReading!.unit!;
      dg_reading_value= homeDashboardModel.dgReading!.value!;
      dg_reading_unit= homeDashboardModel.dgReading!.unit!;
      if(categories.length>4) {
        categories.removeRange(4, categories.length);
      }
      categoriesForNextPage = homeDashboardModel.categories!;
      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }

}