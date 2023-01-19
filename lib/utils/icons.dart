import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppIcons {
  static const home = CupertinoIcons.house_fill;
  static const chat = CupertinoIcons.bubble_left_bubble_right_fill;
  static const account = CupertinoIcons.person_fill;
  static const search = CupertinoIcons.search;
  static const addChat = CupertinoIcons.plus_bubble;
  static const settings = CupertinoIcons.gear;
  static const logout = Icons.logout;
  static const syllabus = CupertinoIcons.doc;
  static const starFilled = CupertinoIcons.star_fill;
  static const starEmpty = CupertinoIcons.star;
  static const back = CupertinoIcons.chevron_back;
  static const forward = CupertinoIcons.chevron_forward;
  static const delete = CupertinoIcons.xmark;
  static const attachment = CupertinoIcons.paperclip;
  static const delivered = CupertinoIcons.checkmark_alt_circle;
  static const seen = CupertinoIcons.checkmark_alt_circle_fill;
  static const error = CupertinoIcons.exclamationmark_circle;
  static const send = CupertinoIcons.paperplane;
  static const info = CupertinoIcons.info;
  static const fav = CupertinoIcons.heart;
  static const suggestion = CupertinoIcons.quote_bubble;
  static const bell = CupertinoIcons.bell;
  static const lang = CupertinoIcons.globe;
  static const help = CupertinoIcons.question;
  static const share = CupertinoIcons.square_arrow_up;
  static const AssetImage support = AssetImage('assets/icons/support.png');
  static const AssetImage team = AssetImage('assets/icons/team.png');
  static const AssetImage fass = AssetImage('assets/icons/fass.png');
  static const AssetImage fens = AssetImage('assets/icons/fens.png');
  static const AssetImage fman = AssetImage('assets/icons/fman.png');
  static const AssetImage other = AssetImage('assets/icons/other.png');
  static const AssetImage action = AssetImage('assets/icons/action.png');
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
