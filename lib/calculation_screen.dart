import 'package:bmi_calculator_three/profile_page.dart';
import 'package:bmi_calculator_three/result_screen.dart';
import 'package:bmi_calculator_three/split_bill.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  Color _maleContainer = Colors.white;
  Color _femaleContainer = Colors.white;
  Color _maleText = Colors.black;
  Color _femaleText = Colors.black;
  Color _beginText = Colors.black;
  Color _beginContainer = Colors.white;
  double _currentSliderValue = 140;
  int _weightValue = 40;
  int _ageValue = 20;
  double bmi = 0;

  void CalculateBMI() {
    if (_currentSliderValue > 0 && _ageValue > 0) {
      setState(() {
        bmi = _weightValue /
            (_currentSliderValue / 100 * _currentSliderValue / 100);
      });
    }
  }

  bool isMaleSelected() {
    return _maleContainer == Colors.cyan;
  }

  bool isFemaleSelected() {
    return _femaleContainer == Colors.cyan;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "F1",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return SplitBillPage();
                        }));
                      },
                      child: const Icon(
                        Icons.dashboard_customize,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'BMI Calculator',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "F2",
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
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _maleContainer = Colors.cyan;
                            _femaleContainer = Colors.white;
                            _maleText = Colors.white;
                            _femaleText = Colors.black;
                          });
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: _maleContainer,
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
                              'Male',
                              style: TextStyle(
                                  color: _maleText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _femaleContainer = Colors.cyan;
                            _maleContainer = Colors.white;
                            _femaleText = Colors.white;
                            _maleText = Colors.black;
                          });
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: _femaleContainer,
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
                              'Female',
                              style: TextStyle(
                                  color: _femaleText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
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
                          child: Column(
                            children: [
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Height',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SfSlider.vertical(
                                  activeColor: Colors.cyan,
                                  min: 100.0,
                                  max: 250.0,
                                  value: _currentSliderValue,
                                  interval: 20,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 2,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  _currentSliderValue.toStringAsFixed(2) +
                                      ' CM',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
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
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        'Weight',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                    Expanded(
                                        child: Center(
                                      child: Text(
                                        _weightValue.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 35,
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: "F3",
                                              onPressed: () {
                                                setState(() {
                                                  _weightValue++;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: "F4",
                                              onPressed: () {
                                                setState(() {
                                                  _weightValue--;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
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
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                    Expanded(
                                        child: Center(
                                      child: Text(
                                        _ageValue.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 35,
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: "F5",
                                              onPressed: () {
                                                setState(() {
                                                  _ageValue++;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: "F6",
                                              onPressed: () {
                                                setState(() {
                                                  _ageValue--;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (isMaleSelected() || isFemaleSelected()) {
                      setState(() {
                        _beginContainer = Colors.cyan;
                        _beginText = Colors.white;
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return ResultScreen(bmi: bmi);
                        }));
                        CalculateBMI();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please Select the Gender')));
                    }
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: _beginContainer,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 9,
                            spreadRadius: 5,
                            //offset: Offset(5, 5),
                          ),
                        ]),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Let's Begin",
                        style: TextStyle(
                            color: _beginText,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
