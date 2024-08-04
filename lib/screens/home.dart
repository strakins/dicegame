import 'package:dicegamee/controllers/dicecontrollers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  final DiceController diceController = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dice Game",
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 28, 95, 107),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Image.asset(
                'assets/${diceController.diceNumber}.png',
                key: ValueKey<int>(diceController.diceNumber.value),
                width: 100,
                height: 100,
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              'Rolled Number: ${diceController.diceNumber}',
              style: TextStyle(fontSize: 30),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.isRolling.value ? null : diceController.rollDice,
              child: Obx(() => diceController.isRolling.value 
                ? CircularProgressIndicator(color: Colors.blue) 
                : Text('Roll Dice')),
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
