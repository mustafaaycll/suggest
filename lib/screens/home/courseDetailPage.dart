// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';

class CourseDetails extends StatefulWidget {
  Course course;
  CourseDetails({super.key, required this.course});

  @override
  State<CourseDetails> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    Course course = widget.course;
    Color courseColor = getFacultyColor(course.faculty);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {},
        backgroundColor: AppColors.sabanci,
        label: ImageIcon(
          AppIcons.action,
          size: 70,
        ),
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
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  AppIcons.syllabus,
                  color: AppColors.bg,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 30,
              )
            ],
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
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            style: ActionButtonStyle(courseColor),
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
                          height: 30,
                          child: OutlinedButton(
                            style: ActionButtonStyle(courseColor),
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
                    height: 7,
                  ),
                  WeakHeader("Instructor suggests"),
                  SizedBox(
                    height: 7,
                  ),
                  suggestionBox(course.instructorSuggestion),
                  SizedBox(
                    height: 7,
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
                      return suggestionBox(course.suggestions[index]);
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
