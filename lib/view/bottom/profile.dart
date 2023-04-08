import 'package:apart/view_model/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Constant/app_colors.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/profile_listtile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends BaseWidget<ProfileVM> {
  const Profile({super.key});

  @override
  Widget buildUI(BuildContext context, ProfileVM viewModel) {
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
          leading:Image.asset("assets/png/logo1.png",),
          title:"Profile",centerTitle:false,
        ),
        body: SingleChildScrollView(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: [
                        viewModel.imageFile== null ? Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:colorWhite,
                              image: DecorationImage(
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
                    Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:"User Name\n",
                          style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w700,color:colorBlue)),
                      TextSpan(
                          text:"Email\n",
                          style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(14),
                              color: colorg,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text:"Numbers",
                          style: GoogleFonts.poppins(
                              fontSize:
                              ScreenUtil().setSp(14),
                              color: colorg,
                              fontWeight: FontWeight.w400)),
                    ])),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }


}