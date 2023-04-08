// ignore: depend_on_referenced_packages
import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/bottom/bottom_screen.dart';
import 'package:apart/view/calendra_screen.dart';
import 'package:apart/view/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/Validator.dart';
import '../../utils/appStrings.dart';
import '../../utils/constants.dart';
import '../../view_model/login_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/rectangle_theme_button.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends BaseWidget<LoginVM>{
  const Login({super.key});

  @override
  Widget buildUI(BuildContext context, LoginVM viewModel) {
    return Container(
      decoration:const BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme,colorWhite,colorLeafGreen]
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
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          Text.rich(
                              textAlign:TextAlign.center,
                              TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                        "Welcome back\n",
                                        style: GoogleFonts.poppins(
                                            fontSize:
                                            ScreenUtil().setSp(16),
                                            color:colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w400)
                                    ),
                                    TextSpan(
                                        text:
                                        "Login to your account \n\n",
                                        style: GoogleFonts.poppins(
                                            fontSize:
                                            ScreenUtil().setSp(21),
                                            color: colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w700)
                                    ),
                                  ])),
                          TextFormField(
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            controller: viewModel.emailController,
                            style: GoogleFonts.poppins(
                                fontSize: ScreenUtil().setSp(14),
                                color: colorText,
                                fontWeight: FontWeight.w400),
                            validator: (value){
                              return  Validator.validateFormField(
                                  value!,
                                  strErrorEmptyEmail,
                                  strInvalidEmail,
                                  Constants.EMAIL_VALIDATION);
                            },
                            onChanged: (String? newValue) {
                              // signInController.gmail.value = newValue!;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(10)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color:colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(10)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(10)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(10)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                              hintText: 'Id',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontStyle: FontStyle.italic,
                                  color:colorText,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          TextFormField(
                            textAlign: TextAlign.start,
                            obscureText:viewModel.passenable,
                            controller: viewModel.passwordController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            style: GoogleFonts.poppins(
                                fontSize: ScreenUtil().setSp(14),
                                color:colorText,
                                fontWeight: FontWeight.w400),
                            validator: (value){
                              return  Validator.validateFormField(
                                  value!,
                                  strEmptyPassword,
                                  strErrorInvalidPassword,
                                  Constants.NORMAL_VALIDATION);
                            },
                            onChanged: (String? newValue) {
                              // signInController.password.value = newValue!;
                            },
                            decoration: InputDecoration(
                                fillColor:colorLightOrange,
                                filled:true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                      .setSp(10)) //                 <--- border radius here
                                  ),
                                  borderSide: const BorderSide(color: colorLightOrange),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                      .setSp(10)) //                 <--- border radius here
                                  ),
                                  borderSide: const BorderSide(color: colorLightOrange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                      .setSp(10)) //                 <--- border radius here
                                  ),
                                  borderSide: const BorderSide(color: colorLightOrange),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                      .setSp(10)) //                 <--- border radius here
                                  ),
                                  borderSide: const BorderSide(color: Colors.red),
                                ),
                                contentPadding:
                                EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(14),
                                    fontStyle: FontStyle.italic,
                                    color:colorText,
                                    fontWeight: FontWeight.w400),
                                suffixIcon: IconButton(onPressed: (){ //add Icon button at end of TextField
                                  if(viewModel.passenable){ //if passenable == true, make it false
                                    viewModel.passenable = false;
                                  }else{
                                    viewModel.passenable = true; //if passenable == false, make it true
                                  }
                                }, icon: Icon(viewModel.passenable == true?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined,color:colorTheme,))
                            ),
                          ),
                          const SizedBox(height:10,),
                          Container(
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: <Widget>[
                                Theme(
                                  data: ThemeData(unselectedWidgetColor:colorTheme),
                                  child: Checkbox(
                                    value: viewModel.rememberMe,
                                    checkColor:colorTheme,
                                    activeColor:colorLightOrange,
                                    onChanged: (value) {
                                      viewModel.rememberMe = value!;
                                    },
                                  ),
                                ),
                                const Flexible(
                                  child: Text.rich(TextSpan(
                                      text: "I Agree to the ",
                                      style: TextStyle(fontSize:12),
                                      children: [
                                        TextSpan(
                                          text:
                                          "Terms of Service ",
                                          style: TextStyle(color:colorTheme,fontWeight:FontWeight.w500,fontSize:12),
                                          // recognizer: TapGestureRecognizer()..onTap = () async{
                                          //   await Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             TermspdfviewScreen()),
                                          //   );
                                          // },
                                        ),
                                        TextSpan(
                                            text: "& ",
                                            style:TextStyle(fontSize:12)
                                        ),
                                        TextSpan(
                                          text: "Privacy Policy",
                                          style:TextStyle(color:colorTheme,fontWeight:FontWeight.w500,fontSize:12),
                                          // recognizer: TapGestureRecognizer()..onTap = () async{
                                          //   await Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             PdfviewScreen()),
                                          //   );
                                          // },
                                        )
                                      ])),
                                )
                              ],
                            ),
                          ),
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
                RectangleThemeButton(text:"Login",onTap:(){
                  viewModel.goHomePage();
                },),
                const SizedBox(height:5,),
                InkWell(
                  onTap:(){
                    context.pushReplacement(SignUp());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',textScaleFactor:1,style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(12),color:colorText,fontWeight: FontWeight.w400)),
                      Text(
                          ' Signup',textScaleFactor:1,
                          style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(12),color:colorTheme,fontWeight: FontWeight.w400)
                      )
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