import 'package:bmi_calculator_three/calculation_screen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToOtherScreen();
  }

  void navigateToOtherScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CalculationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/BMI.gif'),
      ),
    );
  }
}
