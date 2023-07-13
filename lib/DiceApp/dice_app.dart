import 'dart:math';

import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';

class TossApp extends StatefulWidget {
  const TossApp({super.key});

  @override
  State<TossApp> createState() => _TossAppState();
}

class _TossAppState extends State<TossApp> {
  int dice1 = 1;
  int dice2 = 3;

  void Dices() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
    setState(() {
      dice1;
      dice2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Toss App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Dices();
              },
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/dice_app/dice$dice1.png'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Dices();
              },
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/dice_app/dice$dice2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
