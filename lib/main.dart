import 'package:calculator_learn/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final List<String> button = [
  'C',
  'Del',
  "%",
  '/',
  '9',
  '8',
  "7",
  'x',
  '6',
  '5',
  "4",
  '-',
  '3',
  '2',
  "+",
  '1',
  '0',
  '.',
  "Ans",
  '=',
];

var userQuestion = '';

var userAnswer = '';

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child:
                          Text(userQuestion, style: TextStyle(fontSize: 20))),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: button.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion = '';
                              });
                            },
                            buttonText: button[index],
                            color: Colors.green,
                            TextColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                });
                              },
                              buttonText: button[index],
                              color: Colors.red,
                              TextColor:
                                  const Color.fromARGB(255, 107, 29, 29));
                        } else if (index == button.length - 1) {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  equelPressed();
                                });
                              },
                              buttonText: button[index],
                              color: Colors.red,
                              TextColor:
                                  const Color.fromARGB(255, 107, 29, 29));
                        } else {
                          return MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion += button[index];
                              });
                            },
                            buttonText: button[index],
                            color: isOperator(button[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            TextColor: isOperator(button[index])
                                ? Colors.deepPurple
                                : Colors.white,
                          );
                        }
                      }),
                )),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equelPressed() {
    String finalQuestion = userQuestion;

    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();

    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
