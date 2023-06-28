import 'package:bmi_calculator_three/calculation_screen.dart';
import 'package:flutter/material.dart';

class HomepageBMI extends StatefulWidget {
  const HomepageBMI({super.key});

  @override
  State<HomepageBMI> createState() => _HomepageBMIState();
}

class _HomepageBMIState extends State<HomepageBMI> {
  @override
  void initState() {
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
