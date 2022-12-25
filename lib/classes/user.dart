import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:suggest/main.dart';

class User {
  final String fullName;

  User({
    required this.fullName,
  });
}

class StreamedUser {
  final _user = User(fullName: "mustafayucel");
  final _controller = StreamController<User?>();

  Stream<User?> get stream => _controller.stream;

  void initialize() {
    if (ALREADYLOGGEDIN != null && ALREADYLOGGEDIN != 0) {
      _controller.sink.add(_user);
    } else {
      _controller.sink.add(null);
    }
  }

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("loggedInUserExists", 1);
    _controller.sink.add(_user);
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("loggedInUserExists", 0);
    _controller.sink.add(null);
  }
}
