// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static const Color sabanci = Color(0xff003c6c);
  static const Color fass = Color(0xfff24e53);
  static const Color fman = Color(0xff00aeda);
  static const Color fens = Color(0xff15b386);
  static const Color systemGrey = Color(0xff8e8e93);
  static const Color systemGreyLighter = Color(0xffd1d1d6);
  static const Color systemGreyLightest = Color(0xffdedee3);
  static const Color textBlack = Color(0xff06061e);
  static const Color textWhite = Color(0xfff2f2f7);
  static const Color textBlue = Color(0xff003c6c);
  static const Color bg = Color(0xfff2f2f7);
  static const Color negative = Color(0xffbd0d0d);
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

Color getFacultyColorAlt(String faculty) {
  if (faculty == "fman") {
    return Color(0xff00aeda);
  } else if (faculty == "fass") {
    return Color(0xfff24e53);
  } else if (faculty == "fens") {
    return Color(0xff15b386);
  } else {
    return Color(0xff003c6c);
  }
}
