// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:suggest/utils/colors.dart';
import 'package:text_scroll/text_scroll.dart';

const FontStyle ITALIC = FontStyle.italic;

const FontWeight REGULAR = FontWeight.w400;
const FontWeight MEDIUM = FontWeight.w500;
const FontWeight BOLD = FontWeight.w600;
const FontWeight BLACK = FontWeight.w800;
const FontWeight HEAVY = FontWeight.w900;

const double MAINHEADERSIZE = 30;
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

Widget MainHeaderScroll(String txt, bool onWhiteBG) {
  return TextScroll(
    txt,
    mode: TextScrollMode.bouncing,
    velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
    delayBefore: Duration(milliseconds: 500),
    numberOfReps: 1,
    pauseBetween: Duration(milliseconds: 50),
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: MAINHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
    ),
    textAlign: TextAlign.right,
    selectable: true,
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
