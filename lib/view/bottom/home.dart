import 'package:apart/utils/appStrings.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/extensions/on_stream.dart';
import 'package:apart/utils/hive_utils.dart';
import 'package:apart/view/basecom/basecom_reading.dart';
import 'package:apart/view/manpower/manpower_cat_screen.dart';
import 'package:apart/view/otp/otp_screen.dart';
import 'package:apart/view_model/home_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:apart/utils/session_key.dart';
import '../../Constant/app_colors.dart';
import '../../model/SelectApartmentModel.dart';
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
      // decoration:BoxDecoration(
      //     gradient:LinearGradient(
      //         begin: Alignment.topRight,
      //         end: Alignment.bottomLeft,
      //         colors: [colorTheme,colorWhite,colorLeafGreen]
      //     )
      // ),
      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          centerTitle:true,
          backgroundColor:Colors.transparent,
          title:HiveUtils.getSession<String>(SessionKey.user,defaultValue:"{}").userModel().apartment![0].nameOfApartment.toString(),
          leading:const Text(""),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top:5,right:8),
              child: Image.asset("assets/png/logo1.png",),
            )

          ],
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 0, 1),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 1, 8, 0),
                  child: Text("Hello",softWrap:true,
                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                    style: TextStyle(
                      color:colorTheme,letterSpacing:0.2,
                      fontWeight:FontWeight.w600,
                      fontSize:18,
                      fontFamily:"OpenSansItalic",
                    ),),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(8, 1,1, 8),
                  child: Text("${HiveUtils.getSession<String>(SessionKey.user,defaultValue:"{}").userModel().name}" ?? "",softWrap:true,
                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                    style: const TextStyle(
                      color:colorTheme,letterSpacing:0.2,
                      fontWeight:FontWeight.w600,
                      fontSize:18,
                      fontFamily:"OpenSansItalic",
                    ),),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width:size.width/3.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize:MainAxisSize.max,
                              children:   [
                                Align(
                                  alignment:Alignment.center,
                                  child: Text(viewModel.bescon_reading_value.toString(),softWrap:true,
                                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                    style: const TextStyle(
                                      color:colorBlue,
                                      fontWeight:FontWeight.w200,
                                      fontSize:35,
                                    ),maxLines: 1,),
                                ),
                                const SizedBox(height:5,),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment:Alignment.bottomRight,
                                    child: Text("${viewModel.bescon_reading_unit}   ",softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                      style: const TextStyle(
                                        color:colorBlue,
                                        fontWeight:FontWeight.w600,
                                        fontSize:12,fontFamily:"OpenSansItalic"
                                      ),maxLines: 2,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Align(
                          alignment:Alignment.center,
                          child: Text("Bescom Reading",softWrap:true,
                            overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                            style: TextStyle(
                              color:colorBlue,
                              fontWeight:FontWeight.w500,
                              fontSize:12,
                            ),maxLines: 2,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width:size.width/3.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize:MainAxisSize.max,
                              children:   [
                                Align(
                                  alignment:Alignment.center,
                                  child: Text(viewModel.water_reading_value.toString(),softWrap:true,
                                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                    style: const TextStyle(
                                      color:colorBlue,
                                      fontWeight:FontWeight.w200,
                                      fontSize:35,
                                    ),maxLines: 1,),
                                ),
                                const SizedBox(height:5,),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment:Alignment.bottomRight,
                                    child: Text("${viewModel.water_reading_unit}   ",softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily:"OpenSansItalic",
                                        color:colorBlue,
                                        fontWeight:FontWeight.w600,
                                        fontSize:12,
                                      ),maxLines: 2,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Align(
                          alignment:Alignment.center,
                          child: Text("Water Reading",softWrap:true,
                            overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                            style: TextStyle(
                              color:colorBlue,
                              fontWeight:FontWeight.w500,
                              fontSize:12,
                            ),maxLines: 2,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width:size.width/3.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize:MainAxisSize.max,
                              children:  [
                                Align(
                                  alignment:Alignment.center,
                                  child: Text(viewModel.dg_reading_value.toString(),softWrap:true,
                                    overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                    style: const TextStyle(
                                      color:colorBlue,
                                      fontWeight:FontWeight.w200,
                                      fontSize:35,
                                    ),maxLines: 1,),
                                ),
                                const SizedBox(height:5,),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment:Alignment.bottomRight,
                                    child: Text("${viewModel.dg_reading_unit}   ",softWrap:true,
                                      overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                                      style: const TextStyle(
                                        color:colorBlue,
                                        fontFamily:"OpenSansItalic",
                                        fontWeight:FontWeight.w600,
                                        fontSize:12,
                                      ),maxLines: 2,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Align(
                          alignment:Alignment.center,
                          child: Text("DG reading",softWrap:true,
                            overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                            style: TextStyle(
                              color:colorBlue,
                              fontWeight:FontWeight.w500,
                              fontSize:12,
                            ),maxLines: 2,),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10,top:20,left:8,right:8),
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
                          viewModel.bottomBarVM.controller.jumpToPage(1);
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
                  physics: const ScrollPhysics(),
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal:3),
                  children: List.generate(viewModel.categories.length, (i) {
                    var category = viewModel.categories[i];
                    return Padding(
                      padding: const EdgeInsets.only(left:5,right:5,top:5,bottom: 5),
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(msg:viewModel.categories[i].name.toString());
                          if(viewModel.categories[i].name.toString()=="Manpower"){
                            context.push(const ManpowerCatScreen());
                          }
                          else if(viewModel.categories[i].name.toString()=="Bescom Readings"){
                            context.push(const BasecomReading());

                          }
                          else{
                            Fluttertoast.showToast(msg:"coming soon");
                          }

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
                                  padding: const EdgeInsets.only(top:1),
                                  child: Container(
                                    width:itemWidth,
                                    height:itemHeight/1.7,
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
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Padding(
                                        padding: const EdgeInsets.all(2.0),
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
                Padding(
                  padding: const EdgeInsets.only(top:20,bottom:10,left: 8),
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