// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:suggest/classes/code.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/screens/home/courseDetailPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';

class CourseListingByCode extends StatefulWidget {
  Code code;
  List<Course> courses;
  CourseListingByCode({
    super.key,
    required this.courses,
    required this.code,
  });

  @override
  State<CourseListingByCode> createState() => _CourseListingByCodeState();
}

class _CourseListingByCodeState extends State<CourseListingByCode> {
  @override
  Widget build(BuildContext context) {
    List<Course> courses = widget.courses;
    return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          leadingWidth: 40,
          titleSpacing: 0,
          iconTheme: IconThemeData(
            color: AppColors.sabanci,
          ),
          backgroundColor: AppColors.bg,
          title: MainHeaderScroll(widget.code.longName, true),
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
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      pushNewScreen(context,
                          screen: CourseDetails(
                            course: courses[index],
                          ));
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: getFacultyColor(courses[index].faculty),
                      ),
                      height: 60,
                      width: 110,
                      child: Center(
                        child: Text(
                          courses[index].code,
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 20,
                            fontWeight: BOLD,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      courses[index].sbj,
                      style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    subtitle: Text(courses[index].instructorName),
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
