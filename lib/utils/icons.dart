import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppIcons {
  static const home = CupertinoIcons.house_fill;
  static const chat = CupertinoIcons.bubble_left_fill;
  static const account = CupertinoIcons.person_fill;
  static const search = CupertinoIcons.search;
  static const addChat = CupertinoIcons.plus_bubble;
  static const settings = CupertinoIcons.gear;
  static const starFilled = CupertinoIcons.star_fill;
  static const starEmpty = CupertinoIcons.star;
  static const back = CupertinoIcons.chevron_back;
  static const forward = CupertinoIcons.chevron_forward;
  static const delete = CupertinoIcons.xmark;
  static const AssetImage fass = AssetImage('assets/icons/fass.png');
  static const AssetImage fens = AssetImage('assets/icons/fens.png');
  static const AssetImage fman = AssetImage('assets/icons/fman.png');
  static const AssetImage other = AssetImage('assets/icons/other.png');
}

AssetImage getFacultyIcon(String faculty) {
  if (faculty == "fman") {
    return AppIcons.fman;
  } else if (faculty == "fass") {
    return AppIcons.fass;
  } else if (faculty == "fens") {
    return AppIcons.fens;
  } else {
    return AppIcons.other;
  }
}
