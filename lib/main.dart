// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:suggest/classes/user.dart';
import 'package:suggest/navbar.dart';
import 'package:suggest/screens/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

int? ALREADYLOGGEDIN;
StreamedUser USER = StreamedUser();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ALREADYLOGGEDIN = await prefs.getInt("loggedInUserExists");
  USER.initialize();
  runApp(Suggest());
}

class Suggest extends StatefulWidget {
  const Suggest({super.key});

  @override
  State<Suggest> createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return StreamProvider<User?>.value(
      value: USER.stream,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SF'),
        routes: {
          '/Login': (context) => Login(),
          '/NavBar': (context) => NavBar(),
        },
        initialRoute: '/Login',
      ),
    );
  }
}
