// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';

Widget rateBox(int difficuty, int workload) {
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

Widget starRate(int rate, double size) {
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

Widget suggestionBox(Suggestion suggestion) {
  Color color = getFacultyColor(suggestion.faculty);
  AssetImage facultyIcon = getFacultyIcon(suggestion.faculty);
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Container(
                alignment: Alignment(1, -1),
                child: Container(
                  alignment: Alignment(1, -1),
                  color: color,
                  height: 30,
                  width: 30,
                  child: Container(
                    color: color,
                    height: 15,
                    width: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ImageIcon(
                        facultyIcon,
                        color: AppColors.bg,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.bg,
              radius: 24,
              backgroundImage: AssetImage('assets/images/${suggestion.image}.jpg'),
            )
          ],
        ),
        SizedBox(
          width: 7,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 7, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ButtonText(suggestion.uname, false),
                      Text(
                        " - ${suggestion.rank}",
                        style: TextStyle(color: AppColors.bg, fontSize: 10, fontStyle: ITALIC),
                      )
                    ],
                  ),
                  // SuggestionText(
                  //     "Programming skills are NOT required, focus is rather on the design of an interaction type to be proposed by the student. This course is NOT suitable for game interface design task as coding will NOT be taught.",
                  //     false)
                  SuggestionText(suggestion.text, false)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
