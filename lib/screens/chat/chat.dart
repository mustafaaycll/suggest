// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/screens/chat/chatPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

import '../../utils/fonts.dart';

class Chat extends StatefulWidget {
  final User user;
  const Chat({super.key, required this.user});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: MainHeader('Chat', true),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              AppIcons.addChat,
              color: AppColors.sabanci,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.bg,
        child: ListView.builder(
          itemCount: user.enrolledGroups.length,
          itemBuilder: (context, index) {
            print(user.messages[user.enrolledGroups[index].code]![0].toString().runtimeType);
            return ListTile(
              onTap: () {
                pushNewScreen(context,
                    screen: ChatPage(
                      course: user.enrolledGroups[index],
                    ));
              },
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: getFacultyColor(user.enrolledGroups[index].faculty),
                ),
                height: 60,
                width: 110,
                child: Center(
                  child: Text(
                    user.enrolledGroups[index].code,
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 20,
                      fontWeight: BOLD,
                    ),
                  ),
                ),
              ),
              title: Text(
                user.enrolledGroups[index].sbj,
                style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              subtitle: Text(
                "${user.messages[user.enrolledGroups[index].code]!.first.author.firstName.toString()} ${user.messages[user.enrolledGroups[index].code]!.first.author.lastName.toString()}: ${trim(user.messages[user.enrolledGroups[index].code]![0].toString())}",
              ),
              trailing: Icon(
                AppIcons.forward,
                color: AppColors.systemGrey,
              ),
            );
          },
        ),
      ),
    );
  }
}

String trim(String sacmaSey) {
  String f = sacmaSey.substring(sacmaSey.indexOf("Status"));
  String s = f.substring(f.indexOf(" ") + 1);
  String t = s.substring(0, s.indexOf(","));
  return t;
}
