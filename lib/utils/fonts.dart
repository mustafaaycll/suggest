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
const double SUBHEADERSIZE = 17;
const double WEAKHEADERSIZE = 17;
const double FACULTYTILEHEADERSIZE = 20;
const double FACULTYTILEDESCRIPTIONSIZE = 10;

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

Text SubHeader(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: SUBHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: 1,
  );
}

Text WeakHeader(String txt) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: REGULAR,
      fontSize: WEAKHEADERSIZE,
      color: AppColors.systemGrey,
    ),
  );
}

Text FacultyTileHeader(String txt) {
  return Text(txt,
      style: TextStyle(
        fontWeight: BOLD,
        fontSize: FACULTYTILEHEADERSIZE,
        color: AppColors.textWhite,
      ));
}

Text FacultyTileDescription(String txt) {
  return Text(
    txt,
    textAlign: TextAlign.end,
    style: TextStyle(fontSize: FACULTYTILEDESCRIPTIONSIZE, color: AppColors.textWhite),
  );
}
