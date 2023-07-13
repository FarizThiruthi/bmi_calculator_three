import 'package:bmi_calculator_three/SplitBill/split_result.dart';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:bmi_calculator_three/profile_page.dart';
import 'package:flutter/material.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({Key? key}) : super(key: key);

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  final myController = TextEditingController();
  int _people = 2;
  int _tipValue = 10;
  int _taxValue = 5;
  Color _calculateContainer = Colors.white;
  Color _calculateText = Colors.black;
  late double splitAmount;
  late String totalBillText;

  void incrementPeople() {
    setState(() {
      _people++;
    });
  }

  void decrementPeople() {
    setState(() {
      if (_people > 1) {
        _people--;
      }
    });
  }

  double calculateSplitAmount(double totalBill, int numberOfPeople,
      int tipPercentage, int taxPercentage) {
    double totalAmount = totalBill +
        (totalBill * tipPercentage / 100) +
        (totalBill * taxPercentage / 100);
    return totalAmount / numberOfPeople;
  }

  void onCalculatePressed() {
     totalBillText = myController.text;
    double totalBill = double.tryParse(totalBillText) ?? 0.0;

    splitAmount =
        calculateSplitAmount(totalBill, _people, _tipValue, _taxValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "F11",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                          return const Homepage();
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
                          'Split Bill',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "F12",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
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
                    ],
                  ),
                  //child: Text('Hello'),
                  child: Center(
                    child: TextField(
                      controller: myController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        hintText: '999',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.monetization_on,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 5,
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          incrementPeople();
                        },
                        icon: Icon(Icons.add),
                      ),
                      Row(
                        children: [
                          Icon(Icons.people),
                          Text(
                            '  $_people',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          decrementPeople();
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 5,
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Tip',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${_tipValue.toString()} ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 35,
                                      ),
                                    ),
                                    Text(
                                      '\$',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: "F13",
                                      mini: true,
                                      onPressed: () {
                                        setState(() {
                                          _tipValue++;
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
                                      heroTag: "F14",
                                      mini: true,
                                      onPressed: () {
                                        setState(() {
                                          if (_tipValue > 0) {
                                            _tipValue--;
                                          }
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 5,
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Tax',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${_taxValue.toString()} ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 35,
                                      ),
                                    ),
                                    Text(
                                      '%',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: "F15",
                                      mini: true,
                                      onPressed: () {
                                        setState(() {
                                          _taxValue = _taxValue + 5;
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
                                      heroTag: "F16",
                                      mini: true,
                                      onPressed: () {
                                        setState(() {
                                          if (_taxValue > 0) {
                                            _taxValue = _taxValue - 5;
                                          }
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _calculateContainer = Colors.cyan;
                      _calculateText = Colors.white;
                      onCalculatePressed();
                      print(splitAmount);
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SplitResult(
                          splitAmount: splitAmount,
                          people: _people,
                          tipValue: _tipValue,
                          taxValue: _taxValue,
                          totalBillText: totalBillText,
                        );
                      }));
                    });
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _calculateContainer,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 9,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: _calculateText,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
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
