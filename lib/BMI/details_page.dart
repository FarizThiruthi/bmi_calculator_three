import 'package:bmi_calculator_three/bmi/calculation_screen.dart';
import 'package:bmi_calculator_three/InfoProfilePage/profile_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final double bmi;
  final String bmiInterpretation;

  const DetailsPage(
      {super.key, required this.bmi, required this.bmiInterpretation});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final double bmi;
  late final String bmiInterpretation;

  @override
  void initState() {
    super.initState();
    bmi = widget.bmi;
    bmiInterpretation = widget.bmiInterpretation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  FloatingActionButton(
                    heroTag: "F9",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const CalculationScreen();
                      }));
                    },
                    child: const Icon(
                      Icons.change_circle,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'BMI Info',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "F10",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const ProfilePage();
                      }));
                    },
                    child: const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 9,
                        spreadRadius: 5,
                        //offset: Offset(5, 5),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your BMI ',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${bmi.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '$bmiInterpretation',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 9,
                        spreadRadius: 5,
                        //offset: Offset(5, 5),
                      ),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Less than 18.5',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Underweight',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '18.5 to 24.9',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '25 to 29.9',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Overweight',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'More than 29.9',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Obesity',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
