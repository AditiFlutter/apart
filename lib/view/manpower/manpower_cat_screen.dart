import 'package:apart/utils/appStrings.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/bottom/categories.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:apart/view_model/home_vm.dart';
import 'package:apart/view_model/profile_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../Constant/app_colors.dart';
import '../../utils/hive_utils.dart';
import '../../utils/session_key.dart';
import 'ViewModel/manpower_cat_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import 'manpower_shift_data.dart';

class ManpowerCatScreen extends BaseWidget<ManpowerCatVm> {
  const ManpowerCatScreen({super.key});

  @override
  Widget buildUI(BuildContext context, ManpowerCatVm viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth-30;
    // TODO: implement buildUI
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
          title:"ManPower",
          backgroundColor:
          Colors.transparent,
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

                GridView.count(
                  crossAxisCount:2,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                  children: List.generate(viewModel.manpowerCatList.length, (i) {
                    var category = viewModel.manpowerCatList[i];
                    return Padding(
                      padding: const EdgeInsets.only(left:1,right:5,top:15,bottom: 5),
                      child: InkWell(
                        onTap: () {
                          HiveUtils.addSession(SessionKey.catid,viewModel.manpowerCatList[i].name.toString());
                          viewModel.manpowerSubCatId= viewModel.manpowerCatList[i].id.toString();
                          context.push(const ManpowerShiftData());


                        },
                        child: Material(
                          elevation:4,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                    Color(0xff1988c8),
                                    Color(0xff1988c8),
                                    //add more colors for gradient
                                  ],
                                  begin: Alignment.topLeft, //begin of the gradient color
                                  end: Alignment.bottomRight, //end of the gradient color
                                  stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                                //set the stops number equal to numbers of color
                              ),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(top:0),
                                child:SizedBox(
                                  width: itemWidth,
                                  child: Center(
                                    child: Text(category.name.toString(),textScaleFactor: 1,
                                      softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,
                                      style: const TextStyle(
                                        color:Colors.white,
                                        fontWeight:FontWeight.w500,
                                        fontSize:20,  fontFamily:"OpenSansItalic",
                                      ),
                                      maxLines:2,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                // SizedBox(
                //   height: 120,
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount:8,
                //     physics: const AlwaysScrollableScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.only(left:5,right:5,top:5,bottom: 5),
                //         child: InkWell(
                //           onTap: () {
                //           },
                //           child: Wrap(
                //             direction: Axis.vertical,
                //             children: [
                //               Material(
                //                 elevation:4,
                //                 borderRadius: BorderRadius.circular(8),
                //                 child: Container(
                //                   width:70,
                //                   height:70,
                //                   decoration: BoxDecoration(
                //                     color:Colors.white,
                //                     shape: BoxShape.rectangle,
                //                     borderRadius: BorderRadius.circular(8),
                //                   ),
                //                   child: CachedNetworkImage(
                //                     imageUrl: "",
                //                     imageBuilder: (context, imageProvider) => Container(
                //                       decoration: BoxDecoration(
                //                         color:Colors.white,
                //                         shape: BoxShape.rectangle,
                //                         borderRadius: BorderRadius.circular(8),
                //                         image: DecorationImage(
                //                           image: imageProvider,
                //                           fit: BoxFit.contain,
                //                         ),
                //                       ),
                //                     ),
                //                     placeholder: (context, url) => Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Center(child: Image.asset(placeImg)),
                //                     ),
                //                     errorWidget: (context, url, error) => Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Image.asset(placeImg),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               const Padding(
                //                   padding: EdgeInsets.only(top:10),
                //                   child:SizedBox(
                //                     width: 70,
                //                     child: Text("category name",textScaleFactor: 1,
                //                       softWrap:true,
                //                       overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,
                //                       style: TextStyle(
                //                         color:colorTheme,
                //                         fontWeight:FontWeight.w600,
                //                         fontSize:10,
                //                       ),
                //                       maxLines:3,
                //                     ),
                //                   )
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),

              ],
            ),
          ),
        ),

      ),
    );
  }


}
