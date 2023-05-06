import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/profile/manage_account.dart';
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
                  viewModel.profilemodel.user!.avatar.toString().isNotEmpty ? Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:Border.all(color:colorTheme),
                        color:colorWhite,
                        image:DecorationImage(
                            fit: BoxFit.fill,
                            image:NetworkImage(viewModel.profilemodel.user!.avatar.toString()))),
                  ):CircleAvatar(
                    radius: 60.0,
                  //  Image.file(viewModel.imageFile!,fit:BoxFit.contain,).image,),
              backgroundImage: AssetImage("assets/png/profile.png")),
                  // Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child: InkWell(
                  //       onTap: (){
                  //       },
                  //       child: Container(
                  //         height: 34,
                  //         width: 34,
                  //         decoration: const BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color:colorTheme,
                  //         ),
                  //         child: const Center(child: Icon(Icons.mode_edit_outline_outlined,color:colorWhite,)),
                  //
                  //       ),
                  //     )),
                ],
              ),
              const SizedBox(width:30,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                                height: 40,
                                width: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color:Colors.white,
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image:AssetImage("assets/png/batch.jpg"))
                                ),
                              ),
                     SizedBox(width: 10,),
                     Text(viewModel.profilemodel.user!.designation.toString(),
                         style: GoogleFonts.poppins(
                             fontSize: ScreenUtil()
                                 .setSp(18),
                             color: colorg,
                             fontWeight:
                             FontWeight.w600)),
                     SizedBox(width: 15,),
                   ],
                 ),
                  //
                  // Text(viewModel.profilemodel.user!.name.toString(),
                  //     style: GoogleFonts.poppins(
                  //         fontSize: ScreenUtil()
                  //             .setSp(18),
                  //         color: colorg,
                  //         fontWeight:
                  //         FontWeight.w600)),




                ],
              ),

              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  ProfileListTile(onTap: () {
                    context.push(const ManageAccount());
                  }, text: 'Manage Profile', img:'assets/svg/manage_account.svg',),
                  Container(
                    height:1,
                    margin: const EdgeInsets.only(left: 15),
                    color:colorLightOrange,
                  ),
                  ProfileListTile(onTap: () {
                    //context.push(const ManageAccount());
                  }, text: 'FAQ', img:'assets/svg/order.svg',),
                  Container(
                    height:1,
                    margin: const EdgeInsets.only(left: 15),
                    color:colorLightOrange,
                  ),
                  ProfileListTile(onTap: () {
                    //context.push(const ManageAccount());
                  }, text: 'Help Center', img:'assets/svg/help.svg',),
                  Container(
                    height:1,
                    margin: const EdgeInsets.only(left: 15),
                    color:colorLightOrange,
                  ),
                  ProfileListTile(onTap: () {
                    //context.push(const ManageAccount());
                  }, text: 'Privacy Policy', img:'assets/svg/help.svg',),
                  Container(
                    height:1,
                    margin: const EdgeInsets.only(left: 15),
                    color:colorLightOrange,
                  ),



                ],
              ),




              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setSp(50),
                  bottom: ScreenUtil().setSp(20),
                  left: ScreenUtil().setSp(15),
                  right: ScreenUtil().setSp(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
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
                          Container(
                            height: 34,
                            width: 34,
                            decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color:colorWhite,
                                border:Border.all(color:colorTheme)
                            ),
                            child: const Center(child: Icon(Icons.arrow_forward,color:colorTheme,)),

                          ),
                          const SizedBox(width:10,),

                          Text("Logout",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  16,
                                  color:colorTheme,
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