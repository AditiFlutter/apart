// ignore: depend_on_referenced_packages
import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/bottom/bottom_screen.dart';
import 'package:apart/view/calendra_screen.dart';
import 'package:apart/view/login/login_screen.dart';
import 'package:apart/view_model/signup_vm.dart';
import 'package:apart/widgets/country_number.dart';
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


class SignUp extends BaseWidget<SignupVM>{
  const SignUp({super.key});

  @override
  Widget buildUI(BuildContext context, SignupVM viewModel) {
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
              SvgPicture.asset("assets/svg/signup.svg",height:280,),
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
                                        "Signup to your account \n\n",
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
                            controller: viewModel.nameController,
                            style: GoogleFonts.poppins(
                                fontSize: ScreenUtil().setSp(12),
                                color: colorText,
                                fontWeight: FontWeight.w400),
                            validator: (value){
                              return  Validator.validateFormField(
                                  value!,
                                  strErrorName,
                                  strErrorInvalidUserName,
                                  Constants.NORMAL_VALIDATION);
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
                              hintText: 'Name',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: ScreenUtil().setSp(12),
                                  color:colorText,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          TextFormField(
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            controller: viewModel.emailController,
                            style: GoogleFonts.poppins(
                                fontSize: ScreenUtil().setSp(12),
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
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: ScreenUtil().setSp(12),
                                  color:colorText,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          mobileNumberTextFiled(
                              onCountryChanged: (country) {
                                viewModel.countryCode = country.dialCode;
                                viewModel.countryName = country.name;
                              },
                              controller: viewModel.phoneNumber,
                              onChanged: (phone) {
                                if(viewModel.phoneNumber.text.length == 10){
                                  viewModel.visible=true;
                                }
                              }),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select City":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select City",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Delhi",
                              "Luncknow",
                              "Bijnor",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
                          ),
                          SizedBox(
                            height: ScreenUtil().setSp(20),
                          ),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select Society":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select Society",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Delhi",
                              "Luncknow",
                              "Bijnor",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
                          ),
                          const SizedBox(height:20,),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select Building":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select Building",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Delhi",
                              "Luncknow",
                              "Bijnor",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
                          ),
                          const SizedBox(height:20,),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select Flat Number":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select Flat Number",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Delhi",
                              "Luncknow",
                              "Bijnor",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
                          ),
                          const SizedBox(height:20,),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select Type":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select Type",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Owner",
                              "Rental",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
                          ),
                          const SizedBox(height:20,),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value){
                              return value == null ? "Select Designation":null;
                            },
                            decoration: InputDecoration(
                              fillColor:colorLightOrange,
                              filled:true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide:  const BorderSide(color: colorLightOrange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: colorLightOrange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                                    .setSp(8)) //                 <--- border radius here
                                ),
                                borderSide: const BorderSide(color: Colors.red),
                              ),),
                            hint: Text("Select Designation",
                                style: GoogleFonts.poppins(
                                    fontSize: ScreenUtil().setSp(11),
                                    fontStyle: FontStyle.normal,
                                    color:colorBlack,
                                    fontWeight: FontWeight.w400)),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(14),
                                color: colorBlack),
                            items: <String>[
                              "Owner",
                              "Rental",
                            ].map((String value)  {
                              return DropdownMenuItem<String>(
                                onTap:(){
                                },
                                value: value,
                                child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                        ScreenUtil().setSp(12),
                                        color: colorBlack)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                            },
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
                RectangleThemeButton(text:"Signup",onTap:(){
                  context.pushReplacement(const BottomNavigation());
                  // viewModel.goHomePage();
                },),
                const SizedBox(height:5,),
                InkWell(
                  onTap:(){
                    context.pushReplacement(const Login());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already hve an account?',textScaleFactor:1,style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(12),color:colorText,fontWeight: FontWeight.w400)),
                      Text('Login in',textScaleFactor:1,
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