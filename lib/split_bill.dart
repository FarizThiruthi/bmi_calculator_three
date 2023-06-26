import 'package:flutter/material.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({super.key});

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                child: Center(
                  child: Row(
                    children: [
                      buildExpandedIcons(Icon(Icons.add)),
                      buildExpandedButtons('8'),
                      buildExpandedIcons(Icon(Icons.people)),
                      buildExpandedIcons(Icon(Icons.remove)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan,
                ),
              ),
              Row(
                children: [
                  buildExpandedButtons('1'),
                  buildExpandedButtons('2'),
                  buildExpandedButtons('3'),
                ],
              ),
              Row(
                children: [
                  buildExpandedButtons('4'),
                  buildExpandedButtons('5'),
                  buildExpandedButtons('6'),
                ],
              ),
              Row(
                children: [
                  buildExpandedButtons('7'),
                  buildExpandedButtons('8'),
                  buildExpandedButtons('9'),
                ],
              ),
              Row(
                children: [
                  buildExpandedButtons('.'),
                  buildExpandedButtons('0'),
                  buildExpandedIcons(Icon(Icons.backspace_outlined))
                ],
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Split Bill",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Expanded buildExpandedIcons(Icon bicon) {
    return Expanded(
      child: IconButton(onPressed: () {}, icon: bicon),
    );
  }

  Expanded buildExpandedButtons(String btxt) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Text(
          btxt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
