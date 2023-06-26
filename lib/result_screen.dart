import 'package:bmi_calculator_three/calculation_screen.dart';
import 'package:bmi_calculator_three/details_page.dart';
import 'package:bmi_calculator_three/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultScreen extends StatefulWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Color _detailsColor = Colors.white;
  Color _detailsText = Colors.black;
  late final double bmi;

  String _getBMIInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'Under';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Over';
    } else {
      return 'Obese';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bmi = widget.bmi;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: [
              Row(
                children: [
                  FloatingActionButton(
                    heroTag: "F7",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const CalculationScreen();
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'BMI Result',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "F8",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 60),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 9,
                          spreadRadius: 5,
                          //offset: Offset(5, 5),
                        ),
                      ]),
                  //margin: const EdgeInsets.all(8),
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.8,
                          axisLineStyle: const AxisLineStyle(
                              thicknessUnit: GaugeSizeUnit.factor,
                              thickness: 0.15),
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              angle: 180,
                              widget: Text(
                                '${bmi.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ],
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: bmi,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 2000,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.cyan,
                                width: 0.15),
                          ]),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 80,),
                  const Text(
                    'Your have ',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '${_getBMIInterpretation(bmi)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.cyan),
                  ),
                  const Text(
                    ' Body Weight',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _detailsColor = Colors.cyan;
                    _detailsText = Colors.white;
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return DetailsPage(bmi: bmi, bmiInterpretation: _getBMIInterpretation(bmi),);
                    }));
                  });
                },
                child: Container(
                  height: 45,
                  width: 120,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: _detailsColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 9,
                          spreadRadius: 5,
                          //offset: Offset(5, 5),
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      'Details',
                      style: TextStyle(
                          color: _detailsText,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
