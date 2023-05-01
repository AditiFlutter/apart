// ignore: depend_on_referenced_packages
import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/bottom/bottom_screen.dart';
import 'package:apart/view/calendra_screen.dart';
import 'package:apart/view/signup/sign_up.dart';
import 'package:apart/view_model/otp_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/Validator.dart';
import '../../utils/appStrings.dart';
import '../../utils/constants.dart';

import '../../widgets/base_widget.dart';
import '../../widgets/rectangle_theme_button.dart';
import 'package:google_fonts/google_fonts.dart';


class OTP extends BaseWidget<OTPVM>{
  const OTP({super.key});

  @override
  Widget buildUI(BuildContext context, OTPVM viewModel) {
    return Container(
      decoration:const BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme,colorWhite,colorWhite]
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height:50,),
              SvgPicture.asset("assets/svg/login.svg",height:280,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: viewModel.formKey,
                      autovalidateMode: viewModel.autoValidate,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.start,

                        mainAxisSize:MainAxisSize.min,
                        children: [
                          Text.rich(
                              textAlign:TextAlign.center,
                              TextSpan(
                                  children: <TextSpan>[

                                    TextSpan(
                                        text:
                                        "Verify Your Email Account \n\n",
                                        style: GoogleFonts.poppins(
                                            fontSize:
                                            ScreenUtil().setSp(21),
                                            color: colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w700)
                                    ),
                                    TextSpan(text: "An OTP has been send as an Email to the\nEmail Id Provided.\nPlease Enter the OTP, to verify your Email",
                                        style: GoogleFonts.poppins(
                                            fontSize: ScreenUtil().setSp(12),
                                            color: colorBlack),
                                        ),


                                  ])),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          OtpTextField(
                            clearText:true,
                            numberOfFields: 4,
                            borderWidth: 1,

                            keyboardType:TextInputType.number,
                            obscureText: false,
                            cursorColor: Colors.blue,
                            fieldWidth: ScreenUtil().setSp(42),
                            focusedBorderColor: colorTheme,
                            borderColor: colorTheme,
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {

                              print("otpcode"+code.toString());
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                             // print("otpcodesubmit"+verificationCode.toString());
                              viewModel.otp=verificationCode.toString();
                            }, // end onSubmit
                          ),
                          const SizedBox(height:10,),

                          const SizedBox(height:20,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar:Padding(
            padding:const EdgeInsets.only(bottom:10,top:10),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RectangleThemeButton(text:"Verify",onTap:(){
                  viewModel.otpRequest();
                },),
                const SizedBox(height:5,),
                InkWell(
                  onTap:(){
                    context.pushReplacement(SignUp());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

}