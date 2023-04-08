import 'package:apart/utils/appStrings.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/bottom/categories.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:apart/view_model/home_vm.dart';
import 'package:apart/view_model/profile_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Constant/app_colors.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';

class Home extends BaseWidget<HomeVM> {
  const Home({super.key});

  @override
  Widget buildUI(BuildContext context, HomeVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth-10;
    return  Container(
      decoration:const BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme,colorWhite,colorLeafGreen]
          )
      ),
      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          backgroundColor:Colors.transparent,
          title:"App Name",
          leading:Image.asset("assets/png/logo1.png",),centerTitle:false,
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello \nNitesh",softWrap:true,
                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                    style: TextStyle(
                      color:colorBlue,
                      fontWeight:FontWeight.w600,
                      fontSize:20,
                    ),),
                ),
                SizedBox(
                  height:itemWidth-90,
                  child: ListView.builder(
                      shrinkWrap:true,
                      itemCount:3,
                      scrollDirection:Axis.horizontal,
                      itemBuilder: (context, i) {
                        return  Container(
                          width:115,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:15,left: 8,right:8,bottom:15),
                              child: Column(
                                mainAxisSize:MainAxisSize.max,
                                children:  const [
                                  Align(
                                    alignment:Alignment.center,
                                    child: Text("Bescom",softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                      style: TextStyle(
                                        color:colorBlue,
                                        fontWeight:FontWeight.w600,
                                        fontSize:13,
                                      ),maxLines: 2,),
                                  ),
                                  SizedBox(height:10,),
                                  Align(
                                    alignment:Alignment.center,
                                    child: Text("200 unit",softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                      style: TextStyle(
                                        color:colorBlue,
                                        fontWeight:FontWeight.w600,
                                        fontSize:12,
                                      ),maxLines: 2,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20,bottom:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child:const Text("Categories",textScaleFactor: 1,
                            style: TextStyle(color:colorBlue,
                              fontSize: 14, fontWeight: FontWeight.w800,)),
                      ),
                      InkWell(
                        onTap:(){
                          // context.read<BottomBarVM>().setPage(2);
                          // viewModel.bottomBarVM.controller.jumpToPage(2);
                          // context.push(const Categories());
                        },
                        child: const Text("See all",textScaleFactor: 1,
                            style: TextStyle(color:colorBlack, fontSize:12, fontWeight: FontWeight.w500,)),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  crossAxisCount:2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  children: List.generate(viewModel.categories.length, (i) {
                    var category = viewModel.categories[i];
                    return Padding(
                      padding: const EdgeInsets.only(left:5,right:5,top:5,bottom: 5),
                      child: InkWell(
                        onTap: () {
                        },
                        child: Material(
                          elevation:4,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color:Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: Container(
                                    width:70,
                                    height:70,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:category.icon.toString(),
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          color:Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Image.asset(placeImg)),
                                      ),
                                      errorWidget: (context, url, error) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(placeImg),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top:10),
                                    child:SizedBox(
                                      width: 70,
                                      child: Text(category.name.toString(),textScaleFactor: 1,
                                        softWrap:true,
                                        overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,
                                        style: const TextStyle(
                                          color:colorTheme,
                                          fontWeight:FontWeight.w600,
                                          fontSize:10,
                                        ),
                                        maxLines:3,
                                      ),
                                    )
                                ),
                              ],
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
                Padding(
                  padding: const EdgeInsets.only(top:20,bottom:10),
                  child:Container(
                    alignment: Alignment.topLeft,
                    child:const Text("Today's work",textScaleFactor: 1,
                        style: TextStyle(color:colorBlue,
                          fontSize: 14, fontWeight: FontWeight.w800,)),
                  ),
                ),
                ListView.builder(
                    shrinkWrap:true,
                    itemCount:viewModel.services.length,
                    physics:const ScrollPhysics(),
                    scrollDirection:Axis.vertical,
                    itemBuilder: (context, i) {
                      var category = viewModel.services[i];
                      return  Padding(
                        padding: const EdgeInsets.only(bottom:5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top:15,left: 8,right:8,bottom:15),
                            child: Row(
                              mainAxisSize:MainAxisSize.max,
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:CrossAxisAlignment.center,
                              children: [
                                Text(category.name.toString(),softWrap:true,
                                  overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                  style: const TextStyle(
                                    color:colorBlue,
                                    fontWeight:FontWeight.w600,
                                    fontSize:12,
                                  ),maxLines: 2,),
                                const SizedBox(height:15,),
                                Text(category.status.toString(),softWrap:true,
                                  overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                  style: TextStyle(
                                    color:category.status.toString()=="Pending"?colorGreen:Colors.red,
                                    fontWeight:FontWeight.w600,
                                    fontSize:12,
                                  ),maxLines: 2,),
                              ],
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