import 'package:dicegamee/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(HomePage());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/6.png',
                width: 100,
                height: 100,
              ),
            SizedBox(height: 20),
            const Text(
              'Hi, Play Dice',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20),
            const Text(
              'Interesting Game...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}