// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';

import '../../utils/fonts.dart';

class Account extends StatefulWidget {
  final User user;
  final List<Course> courses;
  const Account({super.key, required this.user, required this.courses});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          title: MainHeader('Account', true),
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
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
                        "You will be logged out. Are you sure?",
                        style: TextStyle(color: AppColors.textBlack, fontSize: 15),
                      ),
                      actions: [
                        OutlinedButton(
                          style: ActionButtonStyle(AppColors.negative, true),
                          onPressed: () {
                            Timer(Duration(seconds: 3), () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              USER.logout();
                            });
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
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
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Log Out", false)),
                                    Icon(
                                      AppIcons.logout,
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
                          style: ActionButtonStyle(AppColors.sabanci, true),
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
              },
              icon: Icon(
                AppIcons.logout,
                color: AppColors.negative,
                size: 25,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                personalBox(user),
                SizedBox(
                  height: 15,
                ),
                WeakHeader("Manage past activities"),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Favorited Courses", true)),
                                    Icon(
                                      AppIcons.fav,
                                      color: AppColors.sabanci.withOpacity(0.85),
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Suggestions", true)),
                                    Icon(
                                      AppIcons.suggestion,
                                      color: AppColors.sabanci.withOpacity(0.85),
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Support Offerings", true)),
                                    ImageIcon(
                                      AppIcons.support,
                                      color: AppColors.sabanci,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Project Group Offerings", true)),
                                    ImageIcon(
                                      AppIcons.team,
                                      color: AppColors.sabanci,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                WeakHeader("Manage app settings"),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Notifications", true)),
                                    Icon(
                                      AppIcons.bell,
                                      color: AppColors.sabanci.withOpacity(0.85),
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Language", true)),
                                    Icon(
                                      AppIcons.lang,
                                      color: AppColors.sabanci.withOpacity(0.85),
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Help", true)),
                                    Icon(
                                      AppIcons.help,
                                      color: AppColors.sabanci,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("Invite Friends", true)),
                                    Icon(
                                      AppIcons.share,
                                      color: AppColors.sabanci,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          style: ActionButtonStyleInverted(AppColors.sabanci),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(child: ButtonText("About", true)),
                                    Icon(
                                      AppIcons.info,
                                      color: AppColors.sabanci,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
