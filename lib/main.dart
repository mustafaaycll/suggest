// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:suggest/navbar.dart';
import 'package:suggest/screens/authentication/login.dart';
import 'package:suggest/screens/home/codeListingPage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(Suggest());
}

class Suggest extends StatelessWidget {
  const Suggest({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF'),
      routes: {
        '/Login': (context) => Login(),
        '/NavBar': (context) => NavBar(),
      },
      initialRoute: '/Login',
    );
  }
}
