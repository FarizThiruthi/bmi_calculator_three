import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';

class HangMan extends StatefulWidget {
  const HangMan({Key? key}) : super(key: key);

  @override
  State<HangMan> createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  List<String> alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  bool head = false;
  bool body = false;
  bool rightLeg = false;
  bool leftHand = false;
  bool rightHand = false;
  bool leftLeg = false;

  bool letterF = false;
  bool letterL = false;
  bool letterU = false;
  bool letterT = false;
  bool letterE = false;
  bool letterR = false;

  void displayLetter(String letters) {
    setState(() {
      if (letters.contains('F') && !letterF) {
        letterF = true;
      } else if (letters.contains('L') && !letterL) {
        letterL = true;
      } else if (letters.contains('U') && !letterU) {
        letterU = true;
      } else if (letters.contains('T') && !letterT) {
        letterT = true;
      } else if (letters.contains('E') && !letterE) {
        letterE = true;
      } else if (letters.contains('R') && !letterR) {
        letterR = true;
        showGameWon();
      } else {
        if (!head) {
          head = true;
        } else if (!body) {
          body = true;
        } else if (!rightLeg) {
          rightLeg = true;
        } else if (!leftHand) {
          leftHand = true;
        } else if (!rightHand) {
          rightHand = true;
        } else if (!leftLeg) {
          leftLeg = true;
          showGameOver();
        }
      }
    });
  }

  void showGameWon() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You Win'),
            content: Text('You have won the prize...'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  resetGame();
                },
                child: Text('Ok'),
              )
            ],
          );
        });
  }

  void showGameOver() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('You have reached maximum wrong inputs , Try Again'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: Text('Start Again'),
              )
            ],
          );
        });
  }

  void resetGame() {
    setState(() {
      head = false;
      body = false;
      rightLeg = false;
      leftHand = false;
      rightHand = false;
      leftLeg = false;

      letterF = false;
      letterL = false;
      letterU = false;
      letterT = false;
      letterE = false;
      letterR = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 25),
            Stack(
              children: [
                Image(image: AssetImage('images/hang_man/hang.png')),
                Visibility(
                  visible: head,
                  child: Image(image: AssetImage('images/hang_man/head.png')),
                ),
                Visibility(
                  visible: body,
                  child: Image(image: AssetImage('images/hang_man/body.png')),
                ),
                Visibility(
                  visible: rightLeg,
                  child: Image(image: AssetImage('images/hang_man/ll.png')),
                ),
                Visibility(
                  visible: leftHand,
                  child: Image(image: AssetImage('images/hang_man/la.png')),
                ),
                Visibility(
                  visible: rightHand,
                  child: Image(image: AssetImage('images/hang_man/ra.png')),
                ),
                Visibility(
                  visible: leftLeg,
                  child: Image(image: AssetImage('images/hang_man/rl.png')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer('F', letterF),
                SizedBox(width: 15),
                buildContainer('L', letterL),
                SizedBox(width: 15),
                buildContainer('U', letterU),
                SizedBox(width: 15),
                buildContainer('T', letterT),
                SizedBox(width: 15),
                buildContainer('T', letterT),
                SizedBox(width: 15),
                buildContainer('E', letterE),
                SizedBox(width: 15),
                buildContainer('R', letterR),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: alphabets.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildAlphabets(alphabets[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(String letter, bool isVisible) {
    return Container(
      height: 35,
      width: 32,
      color: Colors.blueGrey.shade200,
      child: Visibility(
        visible: isVisible,
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildAlphabets(String alphabet) {
    Color backgroundColor = Colors.transparent;
    Color textColor = Colors.white70;
    if ((alphabet == 'F' && letterF) ||
        (alphabet == 'L' && letterL) ||
        (alphabet == 'U' && letterU) ||
        (alphabet == 'T' && letterT) ||
        (alphabet == 'E' && letterE) ||
        (alphabet == 'R' && letterR)) {
      backgroundColor = Colors.cyanAccent;
      textColor = Colors.black;
    }
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(1),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      onPressed: () {
        displayLetter(alphabet);
      },
      child: Text(
        alphabet,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
