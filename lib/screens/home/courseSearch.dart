// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suggest/classes/course.dart';
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
    List<Course> suggestions = courses.where((course) {
      final code = course.code.toLowerCase();
      final sbj = course.sbj.toLowerCase();
      final input = query.toLowerCase();

      final result = "$code $sbj";

      return result.contains(input);
    }).toList();

    return Container(
      color: AppColors.bg,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: query.isNotEmpty ? suggestions.length : 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
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
                    style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
