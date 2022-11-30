// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suggest/classes/code.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/pupolarCourse.dart';
import 'package:suggest/data.dart';
import 'package:suggest/screens/home/courseSearch.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Code> codes = initializeCourseCodes();
  List<Course> courses = initializeCourses();
  List<PopularCourse> popularCourses = initializePopularCourses();
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
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CourseSearchDelegate(courses: courses));
                  },
                  icon: Icon(
                    AppIcons.search,
                    color: AppColors.sabanci,
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
                                onPressed: () {},
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
                                    Text("79 course offerings",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: AppColors.textWhite))
                                  ],
                                ))),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButtonStyle(AppColors.fens),
                                onPressed: () {},
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
                                    Text("113 course offerings",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: AppColors.textWhite))
                                  ],
                                ))),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButtonStyle(AppColors.fman),
                                onPressed: () {},
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
                                    Text("94 course offerings",
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
                    itemCount: (codes.length / 3).round(),
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          SizedBox(
                            width: i == 0 ? 15 : 0,
                          ),
                          Column(
                            children: [
                              OutlinedButton(
                                  style: CodeButtonStyle(getFacultyColor(codes[i].faculty)),
                                  onPressed: () {},
                                  child: Text(
                                    codes[i].code,
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
                                  style: CodeButtonStyle(getFacultyColor(codes[i + 21].faculty)),
                                  onPressed: () {},
                                  child: Text(
                                    codes[i + 21].code,
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
                                  style: CodeButtonStyle(getFacultyColor(codes[i + 42].faculty)),
                                  onPressed: () {},
                                  child: Text(
                                    codes[i + 42].code,
                                    style: TextStyle(
                                      fontWeight: BOLD,
                                      fontSize: 20,
                                      color: AppColors.textWhite,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: i == (codes.length / 3).round() - 1 ? 15 : 3,
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
                  itemCount: popularCourses.length,
                  itemBuilder: (context, j) {
                    return Row(
                      children: [
                        SizedBox(
                          width: j == 0 ? 15 : 0,
                        ),
                        OutlinedButton(
                          style: MostReviewedButtonStyle(getFacultyColor(popularCourses[j].faculty)),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        popularCourses[j].code,
                                        style: TextStyle(color: AppColors.textWhite, fontWeight: BOLD, fontSize: 35),
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          popularCourses[j].sbj,
                                          style: TextStyle(
                                              color: AppColors.textWhite, fontWeight: REGULAR, fontSize: 17, overflow: TextOverflow.ellipsis),
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  rateBox(popularCourses[j].difficulty, popularCourses[j].workload)
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  profilePicture("assets/images/${popularCourses[j].suggestions[0].uname}.jpg", 15.0),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${popularCourses[j].suggestions[0].uname} - ${popularCourses[j].suggestions[0].rank}",
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
                                      popularCourses[j].suggestions[0].suggestion,
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
                          width: j + 1 == popularCourses.length ? 15 : 3,
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
