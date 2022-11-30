// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';

Widget rateBox(double difficuty, double workload) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        "Difficulty",
        style: TextStyle(color: AppColors.textWhite, fontSize: 10, fontWeight: REGULAR),
      ),
      starRate(difficuty, 15),
      Text(
        "Workload",
        style: TextStyle(color: AppColors.textWhite, fontSize: 10, fontWeight: REGULAR),
      ),
      starRate(workload, 15),
    ],
  );
}

Widget starRate(double rate, double size) {
  return Row(
    children: [
      Icon(
        rate >= 1 ? AppIcons.starFilled : AppIcons.starEmpty,
        color: AppColors.bg,
        size: size,
      ),
      Icon(
        rate >= 2 ? AppIcons.starFilled : AppIcons.starEmpty,
        color: AppColors.bg,
        size: size,
      ),
      Icon(
        rate >= 3 ? AppIcons.starFilled : AppIcons.starEmpty,
        color: AppColors.bg,
        size: size,
      ),
      Icon(
        rate >= 4 ? AppIcons.starFilled : AppIcons.starEmpty,
        color: AppColors.bg,
        size: size,
      ),
      Icon(
        rate >= 5 ? AppIcons.starFilled : AppIcons.starEmpty,
        color: AppColors.bg,
        size: size,
      ),
    ],
  );
}

Widget profilePicture(String image, double size) {
  return CircleAvatar(
    backgroundImage: AssetImage(image),
    radius: size,
  );
}
