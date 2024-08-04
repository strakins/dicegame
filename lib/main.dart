import 'package:dicegamee/screens/dicescreen.dart';
import 'package:dicegamee/screens/home.dart';
import 'package:dicegamee/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
