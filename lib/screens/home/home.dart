// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
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
      body: Container(
        color: AppColors.bg,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SUGGEST',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                ),
              ),
              Text(
                'SUGGEST',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
              Text(
                'SUGGEST',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
              Text(
                'SUGGEST',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
              Text(
                'SUGGEST',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
