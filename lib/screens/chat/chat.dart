// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

import '../../utils/fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: MainHeader('Chat', true),
        elevation: 0,
        centerTitle: false,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  AppIcons.addChat,
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
      ),
    );
  }
}
