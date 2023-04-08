import 'dart:convert';

import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:provider/provider.dart';
import '../model/HomeDashboardModel.dart';

class HomeVM extends BaseViewModel{

  late BottomBarVM bottomBarVM;
  List<Services> services = [];
  List<Categories> categories = [];

  @override
  initView() {
    bottomBarVM = context.read<BottomBarVM>();
    getHomeData();
    return super.initView();
  }
  void getHomeData() {
    call(path: "dashboard", onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      HomeDashboardModel homeDashboardModel = HomeDashboardModel.fromJson(object['data']);
      services = homeDashboardModel.services!;
      categories = homeDashboardModel.categories!;
      notifyListeners();
    },method: Method.get,isShowLoader: true);
  }

}