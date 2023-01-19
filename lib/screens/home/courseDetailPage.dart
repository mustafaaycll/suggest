// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/main.dart';
import 'package:suggest/screens/home/addSuggestion.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CourseDetails extends StatefulWidget {
  Course course;
  CourseDetails({super.key, required this.course});

  @override
  State<CourseDetails> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    Course course = Provider.of<List<Course>>(context).where((element) => element.code.toUpperCase() == widget.course.code.toUpperCase()).toList()[0];
    Color courseColor = getFacultyColor(course.faculty);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          if (evaluateAvailability(course) != "available") {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.bg,
                    icon: Icon(
                      AppIcons.error,
                      color: AppColors.negative,
                    ),
                    title: Text(
                      evaluateAvailability(course) == "exists" ? "You already suggested something" : "You did not take this course",
                      style: TextStyle(color: AppColors.textBlack, fontSize: 15),
                    ),
                    actions: [
                      OutlinedButton(
                        style: ActionButtonStyle(AppColors.negative, true),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Center(child: ButtonText("Cancel", false)),
                                  Icon(
                                    AppIcons.delete,
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
                  );
                });
          } else {
            pushNewScreen(context, screen: AddSuggestionPage(course: course));
          }
        },
        backgroundColor: evaluateAvailability(course) == "available" ? AppColors.sabanci : AppColors.systemGrey,
        child: Icon(CupertinoIcons.add),
      ),
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: AppColors.bg,
        ),
        backgroundColor: courseColor,
        title: MainHeaderScroll(course.code, false),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              if (course.code.toUpperCase() == "VA325") {
                final client = http.Client();
                final request = await client.get(Uri.parse(
                    "https://sucourse.sabanciuniv.edu/plus/syllabusdownload.php?context=302545&component=mod_folder&filearea=content&itemid=0&filepath=/&filename=VA%20325%20syllabus.doc&mimetype=application/msword"));
                final bytes = request.bodyBytes;
                final documentsDir = (await getApplicationDocumentsDirectory()).path;
                final localPath = '$documentsDir/VA 325 Syllabus.doc';
                if (!File(localPath).existsSync()) {
                  final file = File(localPath);
                  await file.writeAsBytes(bytes);
                }
                await OpenFilex.open(localPath);
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppColors.bg,
                      icon: Icon(
                        AppIcons.error,
                        color: AppColors.negative,
                      ),
                      title: Text(
                        "Syllabus appears to be missing",
                        style: TextStyle(color: AppColors.textBlack, fontSize: 15),
                      ),
                      actions: [
                        OutlinedButton(
                          style: ActionButtonStyle(AppColors.sabanci, true),
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
                                    Center(child: ButtonText("Contact Instructor", false)),
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
                        Platform.isMacOS
                            ? SizedBox(
                                height: 10,
                              )
                            : Container(),
                        OutlinedButton(
                          style: ActionButtonStyle(AppColors.negative, true),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Cancel", false)),
                                    Icon(
                                      AppIcons.delete,
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
                    );
                  },
                );
              }
            },
            icon: Icon(
              AppIcons.syllabus,
              color: course.code.toUpperCase() == "VA325" ? AppColors.bg : AppColors.systemGrey,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: courseColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(41, 0, 41, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeaderNoLineLimit(course.sbj, false),
                          SizedBox(
                            height: 20,
                          ),
                          SubHeader2("Instructor", false),
                          BodyText("${course.instructorName} - ${course.instructorSuggestion.uname}@sabanciuniv.edu", false),
                          SizedBox(
                            height: 10,
                          ),
                          SubHeader2("Description", false),
                          ExpandableBodyText(course.description, false),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SubHeader2("Difficulty", false), starRate(course.difficulty, 12)],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SubHeader2("Workload", false), starRate(course.workload, 12)],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SubHeader2("SU", false), BodyText("${course.su} Credits", false)],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SubHeader2("ECTS", false), BodyText("${course.ects} Credits", false)],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 7, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  suggestionBox(course, course.instructorSuggestion, context),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            style: ActionButtonStyle(courseColor, false),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  AppIcons.support,
                                  color: AppColors.bg,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                ButtonText("Give/Get Support", false)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            style: ActionButtonStyle(courseColor, false),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  AppIcons.team,
                                  color: AppColors.bg,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                ButtonText("Find/Form Team", false)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  WeakHeader("Students suggest"),
                  SizedBox(
                    height: 7,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: course.suggestions.length,
                    itemBuilder: (context, index) {
                      return suggestionBox(course, course.suggestions[index], context);
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String evaluateAvailability(Course c) {
  List<String> takenCourses = [
    "CS201",
    "CS204",
    "CS210",
    "CS300",
    "CS301",
    "CS303",
    "CS306",
    "CS307",
    "CS308",
    "CS310",
    "CS408",
    "CS412",
    "VA325",
    "MGMT203"
  ];

  for (var i = 0; i < c.suggestions.length; i++) {
    if (c.suggestions[i].uname == "mustafayucel") {
      return "exists";
    }
  }

  if (!takenCourses.contains(c.code.toUpperCase())) {
    return "notTaken";
  }

  return "available";
}
