// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static final Color sabanci = Color(0xff003c6c);
  static final Color fass = Color(0xfff24e53);
  static final Color fman = Color(0xff00aeda);
  static final Color fens = Color(0xff15b386);
  static final Color systemGrey = Color(0xff8e8e93);
  static final Color systemGreyLighter = Color(0xffd1d1d6);
  static final Color textBlack = Color(0xff06061e);
  static final Color textWhite = Color(0xfff2f2f7);
  static final Color textBlue = Color(0xff003c6c);
  static final Color bg = Color(0xfff2f2f7);
  static final Color negative = Color(0xffbd0d0d);
}

Color getFacultyColor(String faculty) {
  if (faculty == "fman") {
    return AppColors.fman;
  } else if (faculty == "fass") {
    return AppColors.fass;
  } else if (faculty == "fens") {
    return AppColors.fens;
  } else {
    return AppColors.sabanci;
  }
}
