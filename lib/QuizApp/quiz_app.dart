import 'package:bmi_calculator_three/model/quizAppModel.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<QuizAppModel> questions = [
    QuizAppModel(question: 'Hi there', answer: true),
    QuizAppModel(question: 'Are you there', answer: false),
    QuizAppModel(question: 'Question 3', answer: true),
    QuizAppModel(question: 'question 4', answer: true),
    QuizAppModel(question: 'question 5', answer: false),
    QuizAppModel(question: 'question 6', answer: true),
  ];

  int qes = 0;
  int count = 0;
  List<Widget> answerResults = [];

  String getQuestion() {
    return questions[qes].question;
  }

  bool getAnswer() {
    return questions[qes].answer;
  }

  bool isGameFinished() {
    return qes >= questions.length - 1;
  }

  void isGameOver() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You answered $count out of ${questions.length-1} questions correctly.'),
          actions: [
            TextButton(
              onPressed: () {
                resetQuiz();
                Navigator.pop(context);
              },
              child: Text('Start Again'),
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    if (qes < questions.length - 1) {
      setState(() {
        qes++;
      });
    } else {
      isGameFinished();
    }
  }

  void resetQuiz() {
    setState(() {
      qes = 0;
      count = 0;
      answerResults = [];
    });
  }

  void checkAnswer(bool answer) {
    bool value = getAnswer();
    if (value == answer) {
      answerResults.add(Icon(Icons.done));
      count++;
    } else {
      answerResults.add(Icon(Icons.close));
    }
    nextQuestion();
    if (answerResults.length == 3 && count <= 1) {
      isGameOver();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    getQuestion(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
              ),
              if (!isGameFinished())
                Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Center(
                        child: Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Center(
                        child: Text(
                          'False',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: answerResults,
                ),
              ),
              SizedBox(height: 10),
               if (isGameFinished())
                Column(
                  children: [
                    Text(
                      'Game Finished. Play Again Next Time!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: resetQuiz,
                      child: Text(
                        'Start Again',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                )
              else
                Text(
                  'Correct Answers: $count',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
