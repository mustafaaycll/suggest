// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

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

ButtonStyle ActionButtonStyle(Color color) {
  return OutlinedButton.styleFrom(
    side: BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
    ),
    backgroundColor: color,
  );
}

ButtonStyle CodeButtonStyle(Color color) {
  return OutlinedButton.styleFrom(
    fixedSize: Size(60, 60),
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
