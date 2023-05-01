
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../Constant/app_colors.dart';

class mobileNumberTextFiled extends StatelessWidget {
  mobileNumberTextFiled({
    required this.controller,
    this.onChanged,
    this.onCountryChanged,
  });

  final TextEditingController controller;
  final Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: "IN",
      style: const TextStyle(color:colorText, fontSize: 12, letterSpacing: 1.5),
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        fillColor:colorLightOrange,
        filled:true,
        hintText: 'Phone Number',
        counterText: "",
        contentPadding: EdgeInsets.all(15),
        hintStyle: TextStyle(color:colorText, fontSize: 12, letterSpacing: 1.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color:colorLightOrange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: colorLightOrange),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:colorLightOrange),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      controller: controller,
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
    );
  }
}
