import 'dart:math';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ball = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text('Magic Ball'),
      ),
      body: Center(
        child: GestureDetector(onTap: (){
           setState(() {
             ball = Random().nextInt(4)+ 1;
           });
        },
          child: CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage('images/ball_app/ball$ball.png'),
          ),
        ),
      ),
    );
  }
}
