import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiceController extends GetxController {
  var diceNumber = 1.obs;
  var rollCount = 0.obs;
  var totalSum = 0.obs;
  var isRolling = false.obs;
  final Random _random = Random();
  Timer? _timer;

  void rollDice() {
    isRolling.value = true;
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      diceNumber.value = _random.nextInt(6) + 1;
    });

    Future.delayed(Duration(seconds: 2), () {
      _timer?.cancel();
      diceNumber.value = _random.nextInt(6) + 1;
      totalSum.value += diceNumber.value;
      rollCount.value += 1;
      isRolling.value = false;

      if (diceNumber.value == 6) {
        Fluttertoast.showToast(
          msg: "A 6 has been thrown!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          // backgroundColor: Colors.red,
          backgroundColor: Color.fromARGB(255, 13, 143, 166),
          textColor: Colors.white,
          fontSize: 28.0
        );
      } else if (diceNumber.value % 2 == 0) {
        Fluttertoast.showToast(
          msg: "An even number has been thrown!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          // backgroundColor: Colors.red,
          backgroundColor: Color.fromARGB(255, 13, 143, 166),
          textColor: Colors.white,
          fontSize: 28.0
        );
      } else {
        Fluttertoast.showToast(
          msg: "An odd number has been thrown!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          // backgroundColor: Colors.red,
          backgroundColor: Color.fromARGB(255, 13, 143, 166),
          textColor: Colors.white,
          fontSize: 28.0
        );
      }

      if (rollCount.value == 6) {
        Fluttertoast.showToast(
          msg: "You have rolled the dice 6 times. Total sum: ${totalSum.value}.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          // backgroundColor: Colors.red,
          backgroundColor: Color.fromARGB(255, 13, 143, 166),
          textColor: Colors.white,
          fontSize: 15.0
        );
        resetGame();
      }
    });
  }

  void resetGame() {
    Future.delayed(Duration(seconds: 10), () {
      rollCount.value = 0;
      totalSum.value = 0;
      diceNumber.value = 1;
    });
  }
}
