// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/styles.dart';

class AddSuggestionPage extends StatefulWidget {
  final Course course;
  const AddSuggestionPage({super.key, required this.course});

  @override
  State<AddSuggestionPage> createState() => _AddSuggestionPageState();
}

class _AddSuggestionPageState extends State<AddSuggestionPage> {
  double rating = 0;
  double difRate = 0;
  double worRate = 0;
  String text = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    Course course = widget.course;
    Color color = getFacultyColor(user!.faculty);
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: AppColors.sabanci,
        ),
        backgroundColor: AppColors.bg,
        title: MainHeaderScroll(course.code, true),
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeakHeader("Type your suggestion below"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: color,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
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
                                                  getFacultyIcon(user.faculty),
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
                                        backgroundImage: AssetImage('assets/images/${user.uname}.jpg'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          user.uname,
                                          style: TextStyle(
                                            fontWeight: BOLD,
                                            fontSize: 15,
                                            color: AppColors.textWhite,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          " - Student",
                                          style: TextStyle(color: AppColors.bg, fontSize: 12, fontStyle: ITALIC),
                                        )
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(15),
                                          ),
                                          color: Colors.transparent,
                                          border: Border.all(color: color)),
                                      height: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            text = value;
                                            setState(() {});
                                          },
                                          cursorColor: AppColors.bg,
                                          style: TextStyle(
                                            color: AppColors.bg,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Tap here to start typing...",
                                            hintStyle: TextStyle(
                                              color: AppColors.systemGreyLightest,
                                            ),
                                          ),
                                          expands: true,
                                          maxLines: null,
                                          minLines: null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      WeakHeader("Rate the difficulty"),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SmoothStarRating(
                          size: 38,
                          color: AppColors.sabanci,
                          borderColor: AppColors.sabanci,
                          allowHalfRating: false,
                          defaultIconData: CupertinoIcons.star,
                          filledIconData: CupertinoIcons.star_fill,
                          onRatingChanged: (i) {
                            difRate = i;
                            setState(() {});
                          },
                          rating: difRate,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      WeakHeader("Rate the workload"),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SmoothStarRating(
                          size: 38,
                          color: AppColors.sabanci,
                          borderColor: AppColors.sabanci,
                          allowHalfRating: false,
                          defaultIconData: CupertinoIcons.star,
                          filledIconData: CupertinoIcons.star_fill,
                          onRatingChanged: (j) {
                            worRate = j;
                            setState(() {});
                          },
                          rating: worRate,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: ActionButtonStyle(availableForSubmission() ? AppColors.sabanci : AppColors.systemGrey, false),
                onPressed: () {
                  if (availableForSubmission()) {
                    Timer(Duration(seconds: 3), (() {
                      Navigator.pop(context);
                      Suggestion s = Suggestion(
                        uname: user.uname,
                        faculty: user.faculty,
                        image: user.uname,
                        rank: "Student",
                        text: text,
                      );
                      COURSESSTREAM.addSuggestion(s, course);
                    }));
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 4)).then((_) {
                          Navigator.pop(context);
                        });
                        return AlertDialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          icon: Image.asset(
                            "assets/gifs/loader.gif",
                            height: 30.0,
                            width: 90.0,
                          ),
                        );
                      },
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Center(child: ButtonText("Submit", false)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool availableForSubmission() {
    return text != "" && difRate != 0 && worRate != 0;
  }
}
