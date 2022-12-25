// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/navbar.dart';
import 'package:suggest/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/normal5.png',
                    scale: 4,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          backgroundColor: AppColors.sabanci,
                          side: BorderSide(color: AppColors.sabanci)),
                      onPressed: () {
                        USER.login();
                      },
                      child: Text(
                        "Sign-in with Sabanci ID",
                        style: TextStyle(color: AppColors.textWhite),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return NavBar();
    }
  }
}
