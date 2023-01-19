// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

ButtonStyle OutlinedButtonStyle(Color color) {
  return OutlinedButton.styleFrom(
    side: BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: color,
    padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
  );
}

ButtonStyle ActionButtonStyle(Color color, bool sizeConstraintNeeded) {
  return OutlinedButton.styleFrom(
    padding: Platform.isMacOS && sizeConstraintNeeded ? EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20) : null,
    side: BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
    ),
    backgroundColor: color,
  );
}

ButtonStyle ActionButtonStyleInverted(Color color) {
  return OutlinedButton.styleFrom(
    side: BorderSide(width: 1, color: color),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
    ),
    backgroundColor: Colors.transparent,
  );
}

ButtonStyle CodeButtonStyle(Color color) {
  return OutlinedButton.styleFrom(
    fixedSize: Size(73, 60),
    side: BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: color,
    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
  );
}

ButtonStyle MostReviewedButtonStyle(Color color) {
  return OutlinedButton.styleFrom(
    fixedSize: Size(265, 186),
    side: BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: color,
    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
  );
}
