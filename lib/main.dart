import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Blue', 'score': 1},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Car', 'score': 2},
        {'text': 'Horse', 'score': 7},
        {'text': 'Pig', 'score': 10},
        {'text': 'Cheetah', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favorite number?',
      'answers': [
        {'text': '1', 'score': 10},
        {'text': '256', 'score': 1},
        {'text': '420', 'score': 5}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _return() {
    setState(() {
      _questionIndex--;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
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
          title: Text('First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                stepBack: _return,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
