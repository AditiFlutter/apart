import 'package:apart/utils/extensions/goto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constant/app_colors.dart';
import '../../view_model/manpower_shift_data_vm.dart';
import '../../view_model/manpower_workers_data_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';


class ManpowerWorkersData extends BaseWidget<ManpowerWorkersDataVM> {
  const ManpowerWorkersData({super.key});

  @override
  Widget buildUI(BuildContext context, ManpowerWorkersDataVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth-10;

    return  Container(

      decoration:const BoxDecoration(

          // gradient:LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [colorTheme,colorWhite,colorLeafGreen]
          // )

        color: Colors.white,

      ),

      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          backgroundColor:Colors.transparent,
          actions: [
             AnimatedRotation(
              turns: 10000,
              duration:  Duration(microseconds: 10),
              child:  Image.asset("assets/png/logo1.png",),
            ),

          ],
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 1),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:MainAxisSize.min,
              children: [
                Container(
                  width: itemWidth,
                  child:  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                    child: Text(viewModel.subSubCategoryName.toString(),softWrap:true,
                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,maxLines: 2,
                      style: TextStyle(
                        color:colorBlue,
                        fontWeight:FontWeight.w600,
                        fontSize:25,
                      ),),
                  ),
                ),


                ListView.builder(
                    shrinkWrap:true,


                    itemCount:viewModel.employeeList.length,
                    physics:const ScrollPhysics(),
                    scrollDirection:Axis.vertical,
                    itemBuilder: (context, i) {
                      var category = viewModel.employeeList[i];
                      return  Padding(
                        padding: const EdgeInsets.only(bottom:5),
                        child: InkWell(
                          onTap: () {
                            //Fluttertoast.showToast(msg:viewModel.services[i].name.toString());
                           // context.pushReplacement(const ManpowerShiftData());

                          },
                          child: Card(
                            elevation: 3,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:15,left: 0,right:8,bottom:15),
                              child: Row(
                                mainAxisSize:MainAxisSize.max,
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: Image.asset("assets/png/manicon.png",),
                                      width: itemWidth/3,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(category.employeeName.toString(),softWrap:true,
                                          overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                          style: const TextStyle(
                                            color:colorBlue,
                                            fontWeight:FontWeight.w600,
                                            fontSize:16,
                                          ),maxLines: 2,),
                                        Text("EMP ID: "+category.employeeId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color:Colors.black54,
                                            fontWeight:FontWeight.w600,
                                            fontSize:12,
                                          ),maxLines: 2,),
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(height:15,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),

      ),
    );
  }


}