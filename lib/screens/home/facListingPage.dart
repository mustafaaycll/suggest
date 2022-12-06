// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/code.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/screens/home/codeListingPage.dart';
import 'package:suggest/screens/home/home.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';

class CourseListingByFaculty extends StatefulWidget {
  String faculty;
  String facultLongName;
  List<Code> codes;
  List<Course> courses;
  CourseListingByFaculty({
    super.key,
    required this.faculty,
    required this.facultLongName,
    required this.codes,
    required this.courses,
  });

  @override
  State<CourseListingByFaculty> createState() => _CourseListingByFacultyState();
}

class _CourseListingByFacultyState extends State<CourseListingByFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          leadingWidth: 40,
          titleSpacing: 0,
          iconTheme: IconThemeData(
            color: AppColors.sabanci,
          ),
          backgroundColor: AppColors.bg,
          title: MainHeaderScroll(widget.faculty.toUpperCase(), true),
          elevation: 0,
          centerTitle: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.codes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: CourseListingByCode(
                          courses: filterCoursesByCode(widget.courses, widget.codes[index].code),
                          code: widget.codes[index],
                        ),
                      );
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: getFacultyColor(widget.codes[index].faculty),
                      ),
                      height: 60,
                      width: 110,
                      child: Center(
                        child: Text(
                          widget.codes[index].code,
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 20,
                            fontWeight: BOLD,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.codes[index].longName,
                      style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    subtitle: Text("${getCourseNumberByCode(widget.courses, widget.codes[index].code)} course offerings"),
                    trailing: Icon(
                      AppIcons.forward,
                      color: AppColors.systemGrey,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
