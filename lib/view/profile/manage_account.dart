import 'package:apart/utils/extensions/goto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Constant/app_colors.dart';
import '../../utils/Validator.dart';
import '../../utils/appStrings.dart';
import '../../utils/constants.dart';
import '../../utils/hive_utils.dart';
import '../../view_model/manage_account_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/rectangle_theme_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageAccount extends BaseWidget<ManageAcVM> {
  const ManageAccount({super.key});

  @override
  Widget buildUI(BuildContext context, ManageAcVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth - 20;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        backgroundColor: Colors.white,
        title: "Manage Account",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  viewModel.imageFile == null
                      ? Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 120,
                          child: CachedNetworkImage(
                            imageUrl:viewModel.profileVM.profilemodel.user!.avatar.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: colorBackground,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Center(
                                child:
                                    Image.asset("assets/png/profileimg.png")),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/png/profileimg.png"),
                          ),
                        )
                      : CircleAvatar(
                          radius: 60.0,
                          backgroundImage: Image.file(
                            viewModel.imageFile!,
                            fit: BoxFit.contain,
                          ).image,
                        ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                //Here we will build the content of the dialog
                                return Dialog(
                                  insetPadding: const EdgeInsets.all(30),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Choose option',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                            Icons.camera_alt,
                                            color: colorTheme,
                                          ),
                                          title: const Text('Camera'),
                                          onTap: () {
                                            context.pop();
                                            viewModel.getImgCamera();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.image,
                                              color: colorTheme),
                                          title: const Text('Gallery'),
                                          onTap: () {
                                            context.pop();
                                            viewModel.getImgGallery();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorTheme,
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.mode_edit_outline_outlined,
                            color: colorWhite,
                          )),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setSp(20),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Text("Name",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(12),
                          color: colorTextBlack,
                          letterSpacing: 0.3,
                          height: 1.6,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  controller: viewModel.nameController,
                  style: GoogleFonts.poppins(
                      fontSize: ScreenUtil().setSp(14),
                      color: colorText,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    return Validator.validateFormField(value!, strErrorName,
                        strErrorInvalidUserName, Constants.NORMAL_VALIDATION);
                  },
                  decoration: InputDecoration(
                    fillColor: colorLightOrange,
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: colorTheme,
                        )),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: ScreenUtil().setWidth(10)),

                    hintText: viewModel.profileVM.profilemodel.user!.name,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: ScreenUtil().setSp(14),
                        color: colorText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Text("Email",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(12),
                          color: colorTextBlack,
                          letterSpacing: 0.3,
                          height: 1.6,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.start,

                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,

                  style: GoogleFonts.poppins(
                      fontSize: ScreenUtil().setSp(14),
                      color: colorText,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    return Validator.validateFormField(
                        value!,
                        strErrorEmptyEmail,
                        strInvalidEmail,
                        Constants.EMAIL_VALIDATION);
                  },
                  onChanged: (String? newValue) {
                    // signInController.gmail.value = newValue!;
                  },
                  decoration: InputDecoration(
                    fillColor: colorLightOrange,
                    filled: true,
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: colorTheme,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                          ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    hintText: viewModel.profileVM.profilemodel.user!.email.toString(),

                    hintStyle: GoogleFonts.poppins(
                        fontSize: ScreenUtil().setSp(12),
                        color: colorText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(20),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Text("Address",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(12),
                          color: colorTextBlack,
                          letterSpacing: 0.3,
                          height: 1.6,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  controller: viewModel.addressController,
                  style: GoogleFonts.poppins(
                      fontSize: ScreenUtil().setSp(14),
                      color: colorText,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    return Validator.validateFormField(value!, strErrorName,
                        strErrorInvalidUserName, Constants.NORMAL_VALIDATION);
                  },
                  decoration: InputDecoration(
                    fillColor: colorLightOrange,
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: colorTheme,
                        )),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    hintText: viewModel.profileVM.profilemodel.user!.address.toString(),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: ScreenUtil().setSp(14),
                        color: colorText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Text("Apartment",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(12),
                          color: colorTextBlack,
                          letterSpacing: 0.3,
                          height: 1.6,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,

                  style: GoogleFonts.poppins(
                      fontSize: ScreenUtil().setSp(14),
                      color: colorText,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    return Validator.validateFormField(
                        value!,
                        strErrorEmptyEmail,
                        strInvalidEmail,
                        Constants.EMAIL_VALIDATION);
                  },
                  onChanged: (String? newValue) {
                    // signInController.gmail.value = newValue!;
                  },
                  decoration: InputDecoration(
                    fillColor: colorLightOrange,
                    filled: true,
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: colorTheme,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(
                              10)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    hintText: viewModel.profileVM.profilemodel.user!.apartment.toString(),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: ScreenUtil().setSp(12),
                        color: colorText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: Text("Mobile Number",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(12),
                          color: colorTextBlack,
                          letterSpacing: 0.3,
                          height: 1.6,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left:10,right:10),
              //   child: TextFormField(
              //     textAlign: TextAlign.start,
              //     textAlignVertical: TextAlignVertical.center,
              //     textInputAction: TextInputAction.done,
              //     controller: viewModel.mobileController,
              //     keyboardType: const TextInputType.numberWithOptions(signed: true),
              //     inputFormatters: [
              //       FilteringTextInputFormatter.digitsOnly,
              //     ],
              //     style: GoogleFonts.poppins(
              //         fontSize: ScreenUtil().setSp(14),
              //         color: colorText,
              //         fontWeight: FontWeight.w400),
              //     validator: (value){
              //       return  Validator.validateFormField(
              //           value!,
              //           strErrorEmptyPhone,
              //           strInvalidPhone,
              //           Constants.PHONE_VALIDATION);
              //     },
              //     onChanged: (String? newValue) {
              //       // signInController.gmail.value = newValue!;
              //     },
              //     decoration: InputDecoration(
              //       fillColor:colorLightOrange,
              //       filled:true,
              //       suffixIcon:InkWell(
              //           onTap:(){},
              //           child: const Icon(Icons.mode_edit_outline_outlined,color:colorTheme,)),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
              //             .setSp(10)) //                 <--- border radius here
              //         ),
              //         borderSide: const BorderSide(color:colorLightOrange),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
              //             .setSp(10)) //                 <--- border radius here
              //         ),
              //         borderSide: const BorderSide(color: colorLightOrange),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
              //             .setSp(10)) //                 <--- border radius here
              //         ),
              //         borderSide: const BorderSide(color: colorLightOrange),
              //       ),
              //       errorBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
              //             .setSp(10)) //                 <--- border radius here
              //         ),
              //         borderSide: const BorderSide(color: Colors.red),
              //       ),
              //       contentPadding:
              //       EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              //       hintText: 'Mobile Number',
              //       hintStyle: GoogleFonts.poppins(
              //           fontSize: ScreenUtil().setSp(12),
              //           color:colorText,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ),
              // ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: IntlPhoneField(

                    initialCountryCode: viewModel.countryCode,
                    style: const TextStyle(
                        color: colorText, fontSize: 15, letterSpacing: 1.5),
                    textAlign: TextAlign.start,
                    decoration:  InputDecoration(
                      suffixIcon: const Icon(
                        Icons.mode_edit_outline_outlined,
                        color: colorTheme,
                      ),
                      fillColor: colorLightOrange,
                      filled: true,
                      hintText: viewModel.profileVM.profilemodel.user!.phone.toString(),
                      counterText: "",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: const TextStyle(
                          color: colorText, fontSize: 12, letterSpacing: 1.5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: colorLightOrange),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: colorLightOrange),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: colorLightOrange),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    controller: viewModel.mobileController,
                    onChanged: (phone) {

                    },
                    onCountryChanged: (country) {
                      viewModel.countryCode = country.dialCode;
                      viewModel.countryName = country.name;
                      viewModel.mobileController.text = "";
                    },
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RectangleThemeButton(
        text: "Update",
        onTap: () {
          viewModel.updateProfile();
        },
      ),
    );
  }
}
