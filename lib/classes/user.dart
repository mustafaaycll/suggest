import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/main.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class User {
  final String fullName;
  final String uname;
  final String faculty;
  final String field;
  final List<Course> enrolledGroups;
  Map<String, List<types.Message>> messages;

  User({
    required this.fullName,
    required this.uname,
    required this.faculty,
    required this.field,
    required this.enrolledGroups,
    required this.messages,
  });
}

class StreamedUser {
  final _user = User(
    fullName: "Mustafa Yücel",
    uname: "mustafayucel",
    faculty: "fens",
    field: "Computer Science and Engineering",
    enrolledGroups: filteredCourses(COURSES, ["VA325", "CS303", "MGMT203"]),
    messages: {},
  );
  final _controller = StreamController<User?>();

  Stream<User?> get stream => _controller.stream;

  void initialize() async {
    if (ALREADYLOGGEDIN != null && ALREADYLOGGEDIN != 0) {
      _user.messages = await loadMessages(["VA325", "CS303", "MGMT203"]);
      _controller.sink.add(_user);
    } else {
      _controller.sink.add(null);
    }
  }

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("loggedInUserExists", 1);
    _user.messages = await loadMessages(["VA325", "CS303", "MGMT203"]);
    _controller.sink.add(_user);
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("loggedInUserExists", 0);
    _controller.sink.add(null);
  }
}

Future<Map<String, List<types.Message>>> loadMessages(List<String> enrolledGroups) async {
  Map<String, List<types.Message>> messages = {};

  for (var i = 0; i < enrolledGroups.length; i++) {
    String code = enrolledGroups[i];
    final response = await rootBundle.loadString('assets/messages/${code.toLowerCase()}.json');
    final messagesToAssign = (jsonDecode(response) as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    messages[code] = messagesToAssign;
  }

  return messages;
}
