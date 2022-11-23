// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:suggest/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   'contribute to others\nfacilitate course planning\nfind teammates for projects\nstay in touch with classmates',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: AppColors.textBlack, fontSize: 20),
            // ),
            SizedBox(
              height: 55,
            ),
            // Divider(
            //   thickness: 2,
            //   color: AppColors.sabanci,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
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
                      Navigator.pushReplacementNamed(context, '/NavBar');
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
  }
}
