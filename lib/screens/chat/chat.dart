// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/screens/chat/chatPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

import '../../utils/fonts.dart';

class Chat extends StatefulWidget {
  final User user;
  final List<Course> courses;
  const Chat({super.key, required this.user, required this.courses});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    return Scaffold(
      backgroundColor: AppColors.bg,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 7),
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: user.enrolledGroups.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(0),
              endActionPane: ActionPane(
                extentRatio: 0.3,
                motion: DrawerMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    onPressed: (context) {},
                    backgroundColor: AppColors.negative,
                    foregroundColor: AppColors.bg,
                    label: 'Leave',
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  pushNewScreen(context,
                      screen: ChatPage(
                        course: user.enrolledGroups[index],
                      ));
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: getFacultyColor(user.enrolledGroups[index].faculty),
                  child: ImageIcon(
                    getFacultyIcon(user.enrolledGroups[index].faculty),
                    color: AppColors.bg,
                  ),
                ),
                title: Text(
                  "${user.enrolledGroups[index].code} - ${user.enrolledGroups[index].sbj}",
                  style: TextStyle(color: AppColors.textBlack, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                trailing: Text(
                  "17:20",
                  style: TextStyle(color: AppColors.systemGrey, fontWeight: REGULAR, fontSize: 12, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                subtitle: Text(
                  "John Doe: Ooowww ☺️",
                  style: TextStyle(color: AppColors.systemGrey, fontWeight: REGULAR, fontSize: 15, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
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
