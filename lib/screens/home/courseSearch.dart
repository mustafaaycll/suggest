// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/screens/home/courseDetailPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';

class CourseSearchDelegate extends SearchDelegate {
  final List<Course> courses;
  CourseSearchDelegate({required this.courses});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.bg, iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey), elevation: 0),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          AppIcons.back,
          color: AppColors.sabanci,
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  if (query.isEmpty) {
                    close(context, null);
                  } else {
                    query = '';
                  }
                },
                icon: Icon(
                  AppIcons.delete,
                  color: AppColors.sabanci,
                )),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Course> suggestions = getQuery(courses, query);

    return Container(
      color: AppColors.bg,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: query.isNotEmpty ? suggestions.length : 0,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              pushNewScreen(context, screen: CourseDetails(course: suggestions[index]));
            },
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: getFacultyColor(suggestions[index].faculty),
              ),
              height: 60,
              width: 110,
              child: Center(
                child: Text(
                  suggestions[index].code,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 20,
                    fontWeight: BOLD,
                  ),
                ),
              ),
            ),
            title: Text(
              suggestions[index].sbj,
              style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
            subtitle: Row(
              children: [
                ImageIcon(
                  getFacultyIcon(suggestions[index].faculty),
                  color: AppColors.systemGrey,
                  size: 13,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(suggestions[index].faculty.toUpperCase())
              ],
            ),
            trailing: Icon(
              AppIcons.forward,
              color: AppColors.systemGrey,
            ),
          );
        },
      ),
    );
  }
}

List<Course> getQuery(List<Course> source, String q) {
  List<Course> codeQuery = source.where((s) {
    return s.code.toLowerCase().contains(q);
  }).toList();

  List<Course> sbjQuery = source.where((s) {
    return s.sbj.toLowerCase().contains(q);
  }).toList();

  return codeQuery + sbjQuery;
}
