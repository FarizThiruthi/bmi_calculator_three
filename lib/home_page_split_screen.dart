import 'package:bmi_calculator_three/split_bill.dart';
import 'package:flutter/material.dart';

class HomeSplitBill extends StatefulWidget {
  const HomeSplitBill({super.key});

  @override
  State<HomeSplitBill> createState() => _HomeSplitBillState();
}

class _HomeSplitBillState extends State<HomeSplitBill> {
  @override
  void initState() {
    super.initState();
    navigateToOtherScreen();
  }

  void navigateToOtherScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SplitBillPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/Split.gif'),
      ),
    );
  }
}
