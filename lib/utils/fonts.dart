// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:suggest/utils/colors.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:readmore/readmore.dart';

const FontStyle ITALIC = FontStyle.italic;

const FontWeight REGULAR = FontWeight.w400;
const FontWeight MEDIUM = FontWeight.w500;
const FontWeight BOLD = FontWeight.w600;
const FontWeight BLACK = FontWeight.w800;
const FontWeight HEAVY = FontWeight.w900;

const double MAINHEADERSIZE = 30;
const double SUBHEADERSIZE = 20;
const double SECONDARYSUBHEADERSIZE = 15;
const double BODYTEXTSIZE = 12;
const double BUTTONTEXTSIZE = 12;
const double WEAKHEADERSIZE = 15;
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

Text SubHeaderNoLineLimit(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: SUBHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
    ),
  );
}

Widget SubHeaderScroll(String txt, bool onWhiteBG) {
  return TextScroll(
    txt,
    mode: TextScrollMode.bouncing,
    velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
    delayBefore: Duration(milliseconds: 500),
    numberOfReps: 1,
    pauseBetween: Duration(milliseconds: 50),
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: SUBHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
    ),
    textAlign: TextAlign.right,
    selectable: true,
  );
}

Text SubHeader2(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: SECONDARYSUBHEADERSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: 1,
  );
}

ReadMoreText ExpandableBodyText(String txt, bool onWhiteBG) {
  return ReadMoreText(
    txt,
    style: TextStyle(
      fontWeight: REGULAR,
      fontSize: BODYTEXTSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
      overflow: TextOverflow.ellipsis,
    ),
    moreStyle: TextStyle(
      fontStyle: ITALIC,
      fontWeight: BOLD,
      fontSize: BODYTEXTSIZE,
      color: AppColors.systemGreyLighter,
    ),
    lessStyle: TextStyle(
      fontStyle: ITALIC,
      fontWeight: BOLD,
      fontSize: BODYTEXTSIZE,
      color: AppColors.systemGreyLighter,
    ),
    trimLines: 3,
    colorClickableText: AppColors.systemGrey,
    trimMode: TrimMode.Line,
    trimCollapsedText: ' Show more',
    trimExpandedText: '\nShow less',
  );
}

Text BodyText(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: REGULAR,
      fontSize: BODYTEXTSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Text SuggestionText(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: REGULAR,
      fontSize: BODYTEXTSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
    ),
  );
}

Text ButtonText(String txt, bool onWhiteBG) {
  return Text(
    txt,
    style: TextStyle(
      fontWeight: BOLD,
      fontSize: BUTTONTEXTSIZE,
      color: onWhiteBG ? AppColors.textBlue : AppColors.textWhite,
      overflow: TextOverflow.ellipsis,
    ),
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
