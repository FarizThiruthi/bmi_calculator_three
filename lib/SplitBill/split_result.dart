import 'package:bmi_calculator_three/SplitBill/split_bill.dart';
import 'package:bmi_calculator_three/profile_page.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class SplitResult extends StatefulWidget {
  const SplitResult(
      {super.key,
      required this.splitAmount,
      required this.people,
      required this.tipValue,
      required this.taxValue,
      required this.totalBillText});

  final double splitAmount;
  final int people;
  final int tipValue;
  final int taxValue;
  final String totalBillText;

  @override
  State<SplitResult> createState() => _SplitResultState();
}

class _SplitResultState extends State<SplitResult> {
  late double splitAmount;
  late int _people;
  late int _taxValue;
  late int _tipValue;
  late String totalBillText;

  @override
  void initState() {
    super.initState();
    splitAmount = widget.splitAmount;
    _people = widget.people;
    _taxValue = widget.taxValue;
    _tipValue = widget.tipValue;
    totalBillText = widget.totalBillText;
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
                    heroTag: "F17",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const SplitBillPage();
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Split Result',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "F18",
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
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 9,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$  '),
                      Countup(
                        begin: 0,
                        end: splitAmount,
                        duration: Duration(seconds: 3),
                        separator: ',',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
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
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'People',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  _people.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
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
                                'Tax',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${_taxValue.toString()} %',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
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
                                'Tip',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${_tipValue.toString()} %',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
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
                                'Amount',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${totalBillText.toString()} \$',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
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
