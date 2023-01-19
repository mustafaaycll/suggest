// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/data.dart';
import 'package:suggest/main.dart';
import 'package:suggest/screens/home/courseDetailPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SuggestionDetailedView extends StatefulWidget {
  final Course course;
  final Suggestion suggestion;
  const SuggestionDetailedView({super.key, required this.suggestion, required this.course});

  @override
  State<SuggestionDetailedView> createState() => _SuggestionDetailedViewState();
}

class _SuggestionDetailedViewState extends State<SuggestionDetailedView> {
  final List<String> _randomTexts = [
    "Baby social note like behavior. Prepare in window when relationship court four.Form identify speak either control allow. Police these describe whole accept me.",
    "Business chance send catch himself.Probably song that item. Establish into million sometimes onto.Hand subject candidate beat lead. Lead skin what nearly what.",
    "Know student into blue point. Actually lead occur have. Today candidate source wrong environmental shoulder friend.Trade play yeah join huge happen house. Sometimes hundred current serve cut late.",
    "Much analysis fire write item expert. There I ten point cup sea bed plant. Difference leader teach one who social.Assume key smile involve. Fear final true suggest artist community political.",
    "Add wonder bed table opportunity later role. This so concern argue reason.Throughout accept course help need difference. Water interview while large middle.",
    "Repudiandae et ea odio atque. Ratione culpa rerum esse dolor earum magni. Dolorum vel at a.Cumque libero non. Delectus exercitationem eaque dignissimos.",
    "Itaque saepe autem repudiandae blanditiis ad minus. Iusto expedita dolore. Consequuntur esse quasi ducimus debitis. Sit nulla et delectus consectetur delectus atque.",
    "Model visit computer attention much amount eat.Front move direction politics peace time. Fill model including against American. Work if dinner three seat.",
    "Quis cumque blanditiis nisi reiciendis similique ullam. Repellendus dolore nemo porro labore. Et quaerat atque occaecati.",
    "Doloremque commodi qui deserunt iure nisi excepturi. Dolorum quae at inventore amet voluptatibus facilis. Quis animi illo harum molestias.",
  ];

  final _random = new Random();

  final List<int> _selectedInts = [];

  String getRandomText() {
    int idx = _random.nextInt(_randomTexts.length);
    while (_selectedInts.contains(idx)) {
      idx = _random.nextInt(_randomTexts.length);
    }
    _selectedInts.add(idx);

    return _randomTexts[idx];
  }

  @override
  Widget build(BuildContext context) {
    Course course = widget.course;
    Suggestion suggestion = widget.suggestion;
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: AppColors.sabanci,
        ),
        backgroundColor: AppColors.bg,
        title: MainHeaderScroll("Thread", true),
        elevation: 0,
        centerTitle: false,
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(0),
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
                      SizedBox(
                        height: 3,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: getFacultyColor(suggestion.faculty),
                            radius: 35,
                            child: Container(
                              alignment: Alignment(1, -1),
                              child: Container(
                                alignment: Alignment(1, -1),
                                color: getFacultyColor(suggestion.faculty),
                                height: 35,
                                width: 35,
                                child: Container(
                                  color: getFacultyColor(suggestion.faculty),
                                  height: 15,
                                  width: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ImageIcon(
                                      getFacultyIcon(suggestion.faculty),
                                      color: AppColors.bg,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.bg,
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/${suggestion.image}.jpg'),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          suggestion.uname,
                          style: TextStyle(color: AppColors.sabanci, fontSize: 20, fontWeight: BOLD),
                        ),
                        SuggestionTextSizeAdjusted(suggestion.text, true, 16),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Suggested for ",
                              style: TextStyle(color: AppColors.systemGrey, fontSize: 10, fontStyle: ITALIC),
                            ),
                            Text(
                              course.code,
                              style: TextStyle(color: getFacultyColor(course.faculty), fontSize: 10, fontStyle: ITALIC),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: OutlinedButton(
                        style: ActionButtonStyle(getFacultyColor(suggestion.faculty), false),
                        onPressed: () async {
                          await launchUrl(Uri.parse("mailto:${suggestion.uname}@sabanciuniv.edu"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.mail,
                              color: AppColors.bg,
                              size: 17,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            ButtonText("Send Mail", false)
                          ],
                        ),
                      ),
                    ),
                  ),
                  suggestion.rank == "Instructor"
                      ? Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  child: OutlinedButton(
                                    style: ActionButtonStyle(getFacultyColor(suggestion.faculty), false),
                                    onPressed: () async {
                                      await launchUrl(Uri.parse("https://fass.sabanciuniv.edu/en/faculty_members/detail/559"));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.link,
                                          color: AppColors.bg,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        ButtonText("Visit Website", false)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              suggestion.rank == "Instructor"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            WeakHeader("Other suggestions from ${suggestion.uname}"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            side: BorderSide(color: Colors.transparent),
                          ),
                          onPressed: () {
                            pushNewScreen(
                              context,
                              screen: CourseDetails(
                                course: initializeCourses().where((element) => element.code.toUpperCase() == "CS303").toList().first,
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                      color: AppColors.fens,
                                    ),
                                    height: 40,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "CS303",
                                        style: TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: 12,
                                          fontWeight: BOLD,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      getRandomText(),
                                      style: TextStyle(fontSize: 12, color: AppColors.textBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            side: BorderSide(color: Colors.transparent),
                          ),
                          onPressed: () {
                            pushNewScreen(
                              context,
                              screen: CourseDetails(
                                course: initializeCourses().where((element) => element.code.toUpperCase() == "CS412").toList().first,
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                      color: AppColors.fens,
                                    ),
                                    height: 40,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "CS412",
                                        style: TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: 12,
                                          fontWeight: BOLD,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      getRandomText(),
                                      style: TextStyle(fontSize: 12, color: AppColors.textBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            side: BorderSide(color: Colors.transparent),
                          ),
                          onPressed: () {
                            pushNewScreen(
                              context,
                              screen: CourseDetails(
                                course: initializeCourses().where((element) => element.code.toUpperCase() == "MGMT203").toList().first,
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                      color: AppColors.fman,
                                    ),
                                    height: 40,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "MGMT203",
                                        style: TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: 12,
                                          fontWeight: BOLD,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      getRandomText(),
                                      style: TextStyle(fontSize: 12, color: AppColors.textBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
