import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  final _questions = const [
    {
      'questionText': "What's your favourite color ?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 0},
        {"text": "Black", "score": 1},
      ],
    },
    {
      'questionText': "What's Your favourite animal",
      "answers": [
        {"text": "Dog", "score": 0},
        {"text": "Cat", "score": 2},
        {"text": "Mouse", "score": 7},
        {"text": "Canary", "score": 1},
      ],
    },
    {
      'questionText': "What's Your favourite name ?",
      "answers": [
        {"text": "Shina", "score": 1},
        {"text": "Mayuri", "score": 0},
        {"text": "Adarsh", "score": 10},
        {"text": "None", "score": 5},
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_totalScore);
  }

  void _resetQuize() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quize(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuize),
      ),
    );
  }
}
