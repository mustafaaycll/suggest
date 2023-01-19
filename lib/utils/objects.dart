// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:io' show Platform;

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/screens/home/home.dart';
import 'package:suggest/screens/home/suggestionDetailPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

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

Widget suggestionBoxAlt(Course course, Suggestion suggestion, BuildContext context) {
  Color color = getFacultyColor(suggestion.faculty);
  AssetImage facultyIcon = getFacultyIcon(suggestion.faculty);
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          side: BorderSide(
            color: Colors.transparent,
          )),
      onPressed: () {
        pushNewScreen(context,
            screen: SuggestionDetailedView(
              suggestion: suggestion,
              course: course,
            ));
      },
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
                    SuggestionText(suggestion.text, false)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget suggestionBox(Course course, Suggestion suggestion, BuildContext context) {
  Color color = getFacultyColor(suggestion.faculty);
  AssetImage facultyIcon = getFacultyIcon(suggestion.faculty);
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  side: BorderSide(
                    color: Colors.transparent,
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppColors.bg,
                      icon: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: color,
                                radius: 50,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.bg,
                                radius: 45,
                                backgroundImage: AssetImage('assets/images/${suggestion.image}.jpg'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                              color: getFacultyColor(suggestion.faculty),
                            ),
                            height: 20,
                            width: 70,
                            child: Center(
                              child: Text(
                                suggestion.rank,
                                style: TextStyle(color: AppColors.textWhite, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Column(
                        children: [
                          Text(
                            suggestion.uname,
                            style: TextStyle(color: AppColors.textBlack, fontSize: 15, fontWeight: BOLD),
                          ),
                          Text(
                            suggestion.rank == "Instructor" ? "${suggestion.faculty.toUpperCase()} Faculty Member" : "CS Student",
                            style: TextStyle(color: AppColors.systemGrey, fontSize: 15, fontWeight: REGULAR),
                          ),
                        ],
                      ),
                      actions: [
                        OutlinedButton(
                          style: ActionButtonStyle(getFacultyColor(suggestion.faculty), true),
                          onPressed: () async {
                            await launchUrl(Uri.parse("mailto:${course.instructorSuggestion.uname}@sabanciuniv.edu"));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Send Mail", false)),
                                    Icon(
                                      CupertinoIcons.mail,
                                      color: AppColors.bg,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        suggestion.rank == "Instructor"
                            ? Column(
                                children: [
                                  Platform.isMacOS
                                      ? SizedBox(
                                          height: 10,
                                        )
                                      : Container(),
                                  OutlinedButton(
                                    style: ActionButtonStyle(getFacultyColor(suggestion.faculty), true),
                                    onPressed: () async {
                                      await launchUrl(Uri.parse("https://fass.sabanciuniv.edu/en/faculty_members/detail/559"));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Center(child: ButtonText("Visit Website", false)),
                                              Icon(
                                                CupertinoIcons.link,
                                                color: AppColors.bg,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        suggestion.uname == "murat.germen"
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  WeakHeader("Instructor also added a personal website"),
                                  OutlinedButton(
                                    style: ActionButtonStyle(getFacultyColor(suggestion.faculty), true),
                                    onPressed: () async {
                                      await launchUrl(Uri.parse("https://muratgermen.com/#artworks"));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Center(child: ButtonText("Visit Personal Website", false)),
                                              Icon(
                                                CupertinoIcons.link,
                                                color: AppColors.bg,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.bg,
                        radius: 30,
                        child: Container(
                          alignment: Alignment(1, -1),
                          child: Container(
                            alignment: Alignment(1, -1),
                            color: AppColors.bg,
                            height: 30,
                            width: 30,
                            child: Container(
                              color: AppColors.bg,
                              height: 15,
                              width: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ImageIcon(
                                  facultyIcon,
                                  color: color,
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
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    alignment: Alignment.topLeft,
                    minimumSize: Size(1000, 62),
                    padding: EdgeInsets.all(0),
                    side: BorderSide(
                      color: Colors.transparent,
                    )),
                onPressed: () {
                  pushNewScreen(context,
                      screen: SuggestionDetailedView(
                        suggestion: suggestion,
                        course: course,
                      ));
                },
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
                    SuggestionText(suggestion.text, false)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget personalBox(User? user) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      color: AppColors.sabanci,
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.bg,
                radius: 46,
                child: Container(
                  alignment: Alignment(1, -1),
                  child: Container(
                    alignment: Alignment(1, -1),
                    color: AppColors.bg,
                    height: 46,
                    width: 46,
                    child: Container(
                      color: AppColors.bg,
                      height: 20,
                      width: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ImageIcon(
                          getFacultyIcon("fens"),
                          color: AppColors.fens,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColors.bg,
                radius: 40,
                backgroundImage: AssetImage('assets/images/${user!.uname}.jpg'),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeader(user.fullName, false),
                SizedBox(
                  height: 10,
                ),
                SubBody("Computer Science and Engineering", false),
                SubBody("Student", false),
                SubBody("FENS", false),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
