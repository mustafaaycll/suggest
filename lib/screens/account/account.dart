// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/main.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

import '../../utils/fonts.dart';

class Account extends StatefulWidget {
  final User user;
  const Account({super.key, required this.user});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: MainHeader('Account', true),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              USER.logout();
            },
            icon: Icon(
              AppIcons.logout,
              color: AppColors.negative,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.bg,
      ),
    );
  }
}
