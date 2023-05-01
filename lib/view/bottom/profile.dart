import 'package:apart/view_model/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Constant/app_colors.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/profile_listtile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/rectangle_theme_button.dart';

class Profile extends BaseWidget<ProfileVM> {
  const Profile({super.key});

  @override
  Widget buildUI(BuildContext context, ProfileVM viewModel) {
    return  Container(
      // decoration:const BoxDecoration(
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
          backgroundColor:Colors.transparent,
          leading:Image.asset("assets/png/logo1.png",),
          title:"Profile",centerTitle:true,
        ),
        body: SingleChildScrollView(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Stack(
                children: [
                  viewModel.imageFile== null ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:Border.all(color:colorTheme),
                        color:colorWhite,
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image:AssetImage("assets/png/profile.png"))),
                  ):CircleAvatar(
                    radius: 60.0,
                    backgroundImage:Image.file(viewModel.imageFile!,fit:BoxFit.contain,).image,),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:colorTheme,
                          ),
                          child: const Center(child: Icon(Icons.mode_edit_outline_outlined,color:colorWhite,)),

                        ),
                      )),
                ],
              ),
              const SizedBox(width:25,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(
                          ScreenUtil().setSp(10))),
                ),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  padding: EdgeInsets.only(top: ScreenUtil().setSp(12),bottom: ScreenUtil().setSp(12)),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.all(
                        Radius.circular(
                            ScreenUtil().setSp(10))),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: ScreenUtil()
                                    .setSp(30)),
                                child: Text("Receiver",
                                    style: GoogleFonts.poppins(
                                        fontSize: ScreenUtil()
                                            .setSp(12),
                                        color: colorBlack,
                                        fontWeight:
                                        FontWeight.w300)),
                              )),
                          Text(":  ",style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack,
                              fontWeight:
                              FontWeight.w600)),
                          Expanded(
                            flex: 3,
                            child:  Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text:"Code"": ",
                                  style:GoogleFonts.poppins(
                                      fontSize:
                                      ScreenUtil().setSp(12),
                                      color: colorBlack,
                                      fontWeight:
                                      FontWeight.w600)),
                              TextSpan(
                                  text:"type",
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                      ScreenUtil().setSp(12),
                                      color: colorBlack,
                                      fontWeight:
                                      FontWeight.w600)),
                            ])),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setSp(5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                child: Text("Payer",
                                    style: GoogleFonts.poppins(
                                        fontSize: ScreenUtil()
                                            .setSp(12),
                                        color: colorBlack,
                                        fontWeight:
                                        FontWeight.w300)),
                              )),
                          Text(":  ",style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack,
                              fontWeight:
                              FontWeight.w600)),
                          Expanded(
                            flex: 3,
                            child: Text("name",
                                style: GoogleFonts.poppins(
                                    fontSize:
                                    ScreenUtil().setSp(12),
                                    color: colorBlack,
                                    fontWeight:
                                    FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setSp(5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                child: Text("Network",
                                    style: GoogleFonts.poppins(
                                        fontSize: ScreenUtil()
                                            .setSp(12),
                                        color: colorBlack,
                                        fontWeight:
                                        FontWeight.w300)),
                              )),
                          Text(":  ",style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack,
                              fontWeight:
                              FontWeight.w600)),
                          Expanded(
                            flex: 3,
                            child: Text("RN+",
                                style: GoogleFonts.poppins(
                                    fontSize:
                                    ScreenUtil().setSp(12),
                                    color: colorBlack,
                                    fontWeight:
                                    FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setSp(5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                child: Text("Membership",
                                    style: GoogleFonts.poppins(
                                        fontSize: ScreenUtil()
                                            .setSp(12),
                                        color: colorBlack,
                                        fontWeight:
                                        FontWeight.w300)),
                              )),
                          Text(":  ",style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack,
                              fontWeight:
                              FontWeight.w600)),
                          Expanded(
                            flex: 3,
                            child: Text("159289655",
                                style: GoogleFonts.poppins(
                                    fontSize:
                                    ScreenUtil().setSp(12),
                                    color: colorBlack,
                                    fontWeight:
                                    FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setSp(5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                child: Text("Valid from",
                                    style: GoogleFonts.poppins(
                                        fontSize: ScreenUtil()
                                            .setSp(12),
                                        color: colorBlack,
                                        fontWeight:
                                        FontWeight.w300)),
                              )),
                          Text(":  ",style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack,
                              fontWeight:
                              FontWeight.w600)),
                          Expanded(
                            flex: 3,
                            child: Text("cardExpiry",
                                style: GoogleFonts.poppins(
                                    fontSize:
                                    ScreenUtil().setSp(12),
                                    color: colorBlack,
                                    fontWeight:
                                    FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height:50,
                margin: EdgeInsets.only(
                  top: ScreenUtil().setSp(20),
                  bottom: ScreenUtil().setSp(20),
                  left: ScreenUtil().setSp(15),
                  right: ScreenUtil().setSp(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(colorTheme),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft:
                                Radius.circular(15),
                                bottomRight:
                                Radius.circular(15),
                              ),
                              side: BorderSide(
                                  color: colorTheme)))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,color:colorWhite,),
                          const SizedBox(width:10,),

                          Text("Logout",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  16,
                                  color:colorWhite,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  onPressed:(){
                    viewModel.logOut();
                  },
                ),),
            ],
          ),
        ),

      ),
    );
  }


}