// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/navbar.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:suggest/utils/objects.dart';
import 'package:suggest/utils/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    List<Course> courses = Provider.of<List<Course>>(context);

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.sabanci,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.sabanci,
          elevation: 0,
          title: SizedBox(
            width: 140,
            child: Image.asset('assets/logos/normalinverted5.png'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                MainHeader("Welcome!", false),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText(
                        'Plan your semester',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Get insights about courses',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Stay in touch with the classmates',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Find teammates for the term projects',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Give or get peer supports',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Reach syllabus of any course beforehand',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Learn more about the instructors',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Share your experience, help others',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                      FadeAnimatedText(
                        'Connect with Sabanci University',
                        fadeInEnd: 0.2,
                        fadeOutBegin: 0.8,
                        duration: Duration(seconds: 10),
                        textStyle: TextStyle(fontSize: 20, fontWeight: REGULAR, color: AppColors.textWhite),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        keyboardAppearance: Brightness.dark,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(color: AppColors.bg),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.bg, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.bg, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.fass, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.fass, width: 1),
                          ),
                          errorStyle: TextStyle(color: AppColors.fass),
                          isDense: true,
                          labelText: "SU Username",
                          labelStyle: TextStyle(color: AppColors.systemGreyLighter),
                          prefixIcon: Icon(
                            AppIcons.account,
                            color: AppColors.bg,
                          ),
                          border: InputBorder.none,
                          suffixIcon: _controller.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.text = "";
                                    });
                                  },
                                  icon: Icon(
                                    CupertinoIcons.xmark_circle_fill,
                                    color: AppColors.bg,
                                  )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          }
                          return null;
                        },
                        keyboardAppearance: Brightness.dark,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(color: AppColors.bg),
                        obscureText: visible ? false : true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.bg, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.bg, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.fass, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.fass, width: 1),
                          ),
                          errorStyle: TextStyle(color: AppColors.fass),
                          isDense: true,
                          labelText: "SU Password",
                          labelStyle: TextStyle(color: AppColors.systemGreyLighter),
                          prefixIcon: Icon(
                            CupertinoIcons.lock_fill,
                            color: AppColors.bg,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: visible ? Icon(CupertinoIcons.eye_slash_fill) : Icon(CupertinoIcons.eye_fill),
                            color: AppColors.bg,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  backgroundColor: AppColors.bg,
                                  side: BorderSide(color: AppColors.bg)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Timer(Duration(seconds: 3), () {
                                    Navigator.pop(context);
                                    if (username.trim() == "mustafayucel" && password.trim() == "must") {
                                      USER.login();
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
                                                "User does not exist",
                                                style: TextStyle(color: AppColors.textBlack, fontSize: 15),
                                              ),
                                              actions: [
                                                OutlinedButton(
                                                  style: ActionButtonStyle(AppColors.sabanci, false),
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
                                                            Center(child: ButtonText("Retry", false)),
                                                            Icon(
                                                              CupertinoIcons.arrow_2_circlepath,
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
                                    }
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
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: AppColors.sabanci),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return NavBar(
        user: user,
        courses: courses,
      );
    }
  }
}
