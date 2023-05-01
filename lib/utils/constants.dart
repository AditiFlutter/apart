import 'dart:io';
import 'package:flutter/material.dart';

class Constants {
  static final String baseUrl = 'http://famelinks.in/v1/';
  static const int NORMAL_VALIDATION = 1;
  static const int EMAIL_VALIDATION = 2;
  static const int PHONE_VALIDATION = 3;
  static const int PHONE_OR_EMAIL_VALIDATION = 4;
  static const int PASSWORD_VALIDATION = 5;
  static const int ZIP_VALIDATION = 6;
  static const int MIN_CHAR_VALIDATION = 7;
}
