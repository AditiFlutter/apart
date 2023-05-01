import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/manpower/manpower_workers_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constant/app_colors.dart';
import '../../view_model/manpower_shift_data_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';


class ManpowerShiftData extends BaseWidget<ManpowerShiftDataVM> {
  const ManpowerShiftData({super.key});

  @override
  Widget buildUI(BuildContext context, ManpowerShiftDataVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth-10;

    return  StreamBuilder<String>(
      stream: viewModel.myVariableStream,
        initialData: viewModel.shiftstatus,
      builder: (context, snapshot) {
        var shiftstatus = snapshot.data ?? '';
        return Container(
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
              title:"${viewModel.catname}",
              backgroundColor:Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top:5,right:8),
                  child: Image.asset("assets/png/logo1.png",),
                )

              ],
            ),
            body: SingleChildScrollView(
              child:Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8,top:10,bottom:0),
                              child:InkWell(
                                onTap: () {
                                  viewModel.pickUpSelectDate(context,0);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,

                                      child: const Text("From Date",textScaleFactor: 1,
                                          style: TextStyle(color:colorTheme,decoration:TextDecoration.underline,
                                            fontSize: 14, fontWeight: FontWeight.w800,)),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8,top:5,bottom:10),
                              child:InkWell(
                                onTap: () {
                                  viewModel.pickUpSelectDate(context,0);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,

                                      child: Text(viewModel.fromdate,textScaleFactor: 1,
                                          style: const TextStyle(color:colorBlue,
                                            fontSize: 12, fontWeight: FontWeight.w800,)),
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Icon(Icons.edit,size:16,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8,top:10,bottom:0,right: 8),
                              child:InkWell(
                                onTap: () {
                                  viewModel.pickUpSelectDate(context,1);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      child: const Text("To Date",textScaleFactor: 1,
                                          style: TextStyle(color:colorTheme,decoration:TextDecoration.underline,
                                            fontSize: 14, fontWeight: FontWeight.w800,)),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8,top:5,bottom:10,right: 8),
                              child:InkWell(
                                onTap: () {
                                  viewModel.pickUpSelectDate(context,1);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,

                                      child: Text(viewModel.todate,textScaleFactor: 1,

                                          style: const TextStyle(color:colorBlue,
                                            fontSize: 12, fontWeight: FontWeight.w800,)),
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Icon(Icons.edit,size:16,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:10,bottom:10,right: 30),
                          child:Container(
                            alignment: Alignment.topLeft,
                            child:const Text("Shift",textScaleFactor: 1,
                                style: TextStyle(color:colorBlue,
                                  fontSize: 14, fontWeight: FontWeight.w800,)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:0,top:10,bottom:10,right: 0),
                          child: Row(
                            children: [
                              Padding(padding: const EdgeInsets.only(bottom:5),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: shiftstatus.toString()=="1"?colorGreen:Colors.white)
                                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:5,left: 0,right:0,bottom:5),
                    child: SizedBox(
                      width: 60,
                      child: InkWell(
                        onTap: () {
                          viewModel.updateMyVariable('1');
                        },
                        child: Row(

                                mainAxisSize:MainAxisSize.max,
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: const [
                                  Text("1",softWrap:true,
                                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                    style: TextStyle(
                                      color:colorBlue,
                                      fontWeight:FontWeight.w600,
                                      fontSize:18,
                                    ),maxLines: 2,),
                                  // const SizedBox(height:15,),
                                  Text("st",softWrap:true,
                                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,
                                    style: TextStyle(
                                      color:Colors.blue,
                                      fontWeight:FontWeight.w600,
                                      fontSize:12,
                                    ),maxLines: 2,),
                                ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                              const SizedBox(width: 20,),
                              Padding(
                                padding: const EdgeInsets.only(bottom:5),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: shiftstatus.toString()=="2"?colorGreen:Colors.white)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:5,left: 0,right:0,bottom:5),
                                    child: SizedBox(
                                      width: 60,
                                      child: InkWell(
                                        onTap: () {

                                         viewModel.updateMyVariable('2');

                                        },
                                        child: Row(

                                          mainAxisSize:MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          children: [
                                            const Text("2",softWrap:true,
                                              overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                              style: TextStyle(
                                                color:colorBlue,
                                                fontWeight:FontWeight.w600,
                                                fontSize:18,
                                              ),maxLines: 2,),
                                            // const SizedBox(height:15,),
                                            const Text("nd",softWrap:true,
                                              overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,
                                              style: TextStyle(
                                                color:Colors.blue,
                                                fontWeight:FontWeight.w600,
                                                fontSize:12,
                                              ),maxLines: 2,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Padding(
                                padding: const EdgeInsets.only(bottom:5),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: shiftstatus.toString()=="3"?colorGreen:Colors.white)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:5,left: 0,right:0,bottom:5),
                                    child: SizedBox(
                                      width: 60,
                                      child: InkWell(
                                        onTap: () {

                                          viewModel.updateMyVariable('3');

                                        },
                                        child: Row(
                                          mainAxisSize:MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          children: [
                                            const Text("3",softWrap:true,
                                              overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                              style: TextStyle(
                                                color:colorBlue,
                                                fontWeight:FontWeight.w600,
                                                fontSize:18,
                                              ),maxLines: 2,),
                                            // const SizedBox(height:15,),
                                            const Text("rd",softWrap:true,
                                              overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,
                                              style: TextStyle(
                                                color:Colors.blue,
                                                fontWeight:FontWeight.w600,
                                                fontSize:12,
                                              ),maxLines: 2,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    ListView.builder(
                        shrinkWrap:true,
                        itemCount:viewModel.manpowerShifDataList.length,
                        physics:const ScrollPhysics(),
                        scrollDirection:Axis.vertical,
                        itemBuilder: (context, i) {
                          var category = viewModel.manpowerShifDataList[i];
                          return  Padding(
                            padding: const EdgeInsets.only(bottom:5),
                            child: InkWell(
                              onTap: () {
                               // Fluttertoast.showToast(msg:viewModel.manpowerShifDataList[i].designationId.toString());
                                viewModel.subsubcategoryId=viewModel.manpowerShifDataList[i].subcategoryId.toString();
                                context.push(const ManpowerWorkersData());

                              },
                              child: Card(
                                elevation: 3,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top:15,left:30,right:30,bottom:15),
                                  child: Row(
                                    mainAxisSize:MainAxisSize.max,
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      Text(category.subcategoryName.toString(),softWrap:true,
                                        overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                        style: const TextStyle(
                                          color:colorBlue,
                                          fontWeight:FontWeight.w600,
                                          fontSize:18,
                                        ),maxLines: 2,),
                                      // const SizedBox(height:15,),
                                      Text(category.employeeCount.toString(),softWrap:true,
                                        overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                        style: const TextStyle(
                                          color:colorTheme,
                                          fontWeight:FontWeight.w600,
                                          fontSize:18,
                                        ),maxLines: 2,),
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
    );
  }


}