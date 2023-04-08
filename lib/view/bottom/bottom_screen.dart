import 'package:apart/Constant/app_colors.dart';
import 'package:apart/view/bottom/categories.dart';
import 'package:apart/view/bottom/home.dart';
import 'package:apart/view/bottom/profile.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:apart/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';



class BottomNavigation extends BaseWidget<BottomBarVM>{
  const BottomNavigation({super.key});


  @override
  Widget buildUI(BuildContext context, BottomBarVM viewModel) {
    return Container(
      decoration:const BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme,colorWhite,colorLeafGreen]
          )
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor:Colors.transparent,
        body: SafeArea(
          child: WillPopScope(
            onWillPop: (){
              return onexit(context);
            },
            child: IndexedStack(
              index:viewModel.currentsIndex,
              children:  const [
                Home(),
                // Calendar(),
                Categories(),
                Text("CCC"),
                Profile(),
              ],
            ),
          ),
        ),
        bottomNavigationBar:Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomNavigationBar(
            iconSize: 30.0,
            selectedColor:colorWhite,
            strokeColor:colorLeafGreen,
            unSelectedColor:colorWhite,
            borderRadius: const Radius.circular(15.0),
            backgroundColor:colorTheme,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home_sharp),
                // title: const Text("Home"),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.schedule_send_sharp),
                // title: const Text("Cart"),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.note_alt_sharp),
                // title: const Text("Search"),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.account_circle_sharp),
                // title: const Text("Me"),
              ),
            ],
            currentIndex: viewModel.currentsIndex,
            onTap: (index) {
              viewModel.changeTabIndex(index);
            },
          ),
        )
      ),
    );
  }
  Future<bool> onexit(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Container(
            margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
            height: 100,
            child: Column(
              children: <Widget>[
                const Text("Are you sure you want to exit?"),
                Container(
                  margin: const EdgeInsets.only(top: 22),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  offset: const Offset(0.0, 1.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0)
                            ],
                            color: colorTheme,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  offset: const Offset(0.0, 1.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0)
                            ],
                            color:colorTheme,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("Yes",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
