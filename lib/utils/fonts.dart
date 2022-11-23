// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:suggest/utils/colors.dart';

const FontStyle ITALIC = FontStyle.italic;

const FontWeight REGULAR = FontWeight.w400;
const FontWeight MEDIUM = FontWeight.w500;
const FontWeight BOLD = FontWeight.w600;
const FontWeight BLACK = FontWeight.w800;
const FontWeight HEAVY = FontWeight.w900;

const double MAINHEADERSIZE = 40;
const double WEAKHEADERSIZE = 20;

Text MainHeader(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: MAINHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
    ),
  );
}

Text WeakHeader(String txt) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: WEAKHEADERSIZE,
      color: AppColors.systemGrey,
    ),
  );
}
