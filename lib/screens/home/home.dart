// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suggest/classes/code.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/pupolarCourse.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/data.dart';
import 'package:suggest/main.dart';
import 'package:suggest/screens/home/courseDetailPage.dart';
import 'package:suggest/screens/home/courseListingPage.dart';
import 'package:suggest/screens/home/courseSearch.dart';
import 'package:suggest/screens/home/codeListingPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          elevation: 0,
          centerTitle: false,
          title: SizedBox(
            width: 140,
            child: Image.asset('assets/logos/normal5.png'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CourseSearchDelegate(courses: COURSES));
              },
              icon: Icon(
                AppIcons.search,
                color: AppColors.sabanci,
                size: 25,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeakHeader("Explore by faculty"),
                    SizedBox(
                      height: 7.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButtonStyle(AppColors.fass),
                                onPressed: () {
                                  pushNewScreen(context,
                                      screen: CodeListingByFaculty(
                                        faculty: "fass",
                                        facultLongName: "Faculty of Art and Social Sciences",
                                        codes: filterCodesByFaculty(CODES, "fass"),
                                        courses: COURSES,
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        ImageIcon(
                                          AppIcons.fass,
                                          color: AppColors.bg,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FacultyTileHeader("FASS"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        FacultyTileDescription("Faculty of Art and\nSocial Sciences")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("${getCourseNumberByFaculty(COURSES, 'fass')} course offerings",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: AppColors.textWhite))
                                  ],
                                ))),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButtonStyle(AppColors.fens),
                                onPressed: () {
                                  pushNewScreen(context,
                                      screen: CodeListingByFaculty(
                                        faculty: "fens",
                                        facultLongName: "Faculty of Engineering and Natural Sciences",
                                        codes: filterCodesByFaculty(CODES, "fens"),
                                        courses: COURSES,
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        ImageIcon(
                                          AppIcons.fens,
                                          color: AppColors.bg,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FacultyTileHeader("FENS"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        FacultyTileDescription("Faculty of Engineering\nand Natural Sciences"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("${getCourseNumberByFaculty(COURSES, 'fens')} course offerings",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: AppColors.textWhite))
                                  ],
                                ))),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButtonStyle(AppColors.fman),
                                onPressed: () {
                                  pushNewScreen(context,
                                      screen: CodeListingByFaculty(
                                        faculty: "fman",
                                        facultLongName: "Faculty of Management",
                                        codes: filterCodesByFaculty(CODES, "fman"),
                                        courses: COURSES,
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        ImageIcon(
                                          AppIcons.fman,
                                          color: AppColors.bg,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FacultyTileHeader("FMAN"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        FacultyTileDescription("Faculty of\nManagement"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("${getCourseNumberByFaculty(COURSES, 'fman')} course offerings",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: AppColors.textWhite))
                                  ],
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  WeakHeader("Explore by course code"),
                ],
              ),
              SizedBox(
                height: 7.5,
              ),
              SizedBox(
                height: 186,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (CODES.length / 3).round(),
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          SizedBox(
                            width: i == 0 ? 15 : 0,
                          ),
                          Column(
                            children: [
                              OutlinedButton(
                                  style: CodeButtonStyle(getFacultyColor(CODES[i].faculty)),
                                  onPressed: () {
                                    pushNewScreen(context,
                                        screen: CourseListingByCode(
                                          courses: filterCoursesByCode(COURSES, CODES[i].code),
                                          code: CODES[i],
                                        ));
                                  },
                                  child: Text(
                                    CODES[i].code,
                                    style: TextStyle(
                                      fontWeight: BOLD,
                                      fontSize: 20,
                                      color: AppColors.textWhite,
                                    ),
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              OutlinedButton(
                                  style: CodeButtonStyle(getFacultyColor(CODES[i + 21].faculty)),
                                  onPressed: () {
                                    pushNewScreen(context,
                                        screen: CourseListingByCode(
                                          courses: filterCoursesByCode(COURSES, CODES[i + 21].code),
                                          code: CODES[i + 21],
                                        ));
                                  },
                                  child: Text(
                                    CODES[i + 21].code,
                                    style: TextStyle(
                                      fontWeight: BOLD,
                                      fontSize: 20,
                                      color: AppColors.textWhite,
                                    ),
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              OutlinedButton(
                                  style: CodeButtonStyle(getFacultyColor(CODES[i + 42].faculty)),
                                  onPressed: () {
                                    pushNewScreen(context,
                                        screen: CourseListingByCode(
                                          courses: filterCoursesByCode(COURSES, CODES[i + 42].code),
                                          code: CODES[i + 42],
                                        ));
                                  },
                                  child: Text(
                                    CODES[i + 42].code,
                                    style: TextStyle(
                                      fontWeight: BOLD,
                                      fontSize: 20,
                                      color: AppColors.textWhite,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: i == (CODES.length / 3).round() - 1 ? 15 : 3,
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  WeakHeader("Most reviewed courses"),
                ],
              ),
              SizedBox(
                height: 7.5,
              ),
              SizedBox(
                height: 186,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: POPULARCOURSES.length,
                  itemBuilder: (context, j) {
                    return Row(
                      children: [
                        SizedBox(
                          width: j == 0 ? 15 : 0,
                        ),
                        OutlinedButton(
                          style: MostReviewedButtonStyle(getFacultyColor(POPULARCOURSES[j].faculty)),
                          onPressed: () {
                            pushNewScreen(context, screen: CourseDetails(course: POPULARCOURSES[j]));
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        POPULARCOURSES[j].code,
                                        style: TextStyle(color: AppColors.textWhite, fontWeight: BOLD, fontSize: 35),
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          POPULARCOURSES[j].sbj,
                                          style: TextStyle(
                                              color: AppColors.textWhite, fontWeight: REGULAR, fontSize: 17, overflow: TextOverflow.ellipsis),
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  rateBox(POPULARCOURSES[j].difficulty, POPULARCOURSES[j].workload)
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  profilePicture("assets/images/${POPULARCOURSES[j].suggestions[0].image}.jpg", 15.0),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${POPULARCOURSES[j].suggestions[0].uname} - ${POPULARCOURSES[j].suggestions[0].rank}",
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontWeight: BOLD,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 195,
                                    height: 54,
                                    child: Text(
                                      POPULARCOURSES[j].suggestions[0].text,
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 3,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: j + 1 == POPULARCOURSES.length ? 15 : 3,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

int getCourseNumberByCode(List<Course> courses, String code) {
  return filterCoursesByCode(courses, code).length;
}

int getCourseNumberByFaculty(List<Course> courses, String fac) {
  return filterCoursesByFaculty(courses, fac).length;
}

List<Course> filterCoursesByCode(List<Course> courses, String code) {
  return courses.where((course) {
    return getCodeFromFull(course.code) == code;
  }).toList();
}

List<Course> filterCoursesByFaculty(List<Course> courses, String fac) {
  return courses.where((course) {
    return course.faculty == fac;
  }).toList();
}

List<Code> filterCodesByFaculty(List<Code> codes, String fac) {
  return codes.where((code) {
    return code.faculty == fac;
  }).toList();
}

String getCodeFromFull(String fullCode) {
  int index = fullCode.indexOf(RegExp(r'[0-9]'));
  return fullCode.substring(0, index);
}
