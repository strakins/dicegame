import 'package:dicegamee/controllers/dicecontrollers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DiceScreen extends StatelessWidget {
  final DiceController diceController = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Image.asset(
              'assets/dice${diceController.diceNumber}.png',
              width: 100,
              height: 100,
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              'Rolled Number: ${diceController.diceNumber}',
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.rollDice,
              child: Text('Roll Dice'),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              'Total Rolls: ${diceController.rollCount}',
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(height: 10),
            Obx(() => Text(
              'Total Sum: ${diceController.totalSum}',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
