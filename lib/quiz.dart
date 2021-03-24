import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final Function stepBack;
  final int questionIndex;

  Quiz(
      {@required this.questions, @required this.questionIndex, @required this.answerQuestion, @required this.stepBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(label: answer, handler: answerQuestion);
        }).toList(),
        ElevatedButton(
          child: Text('return'),
          onPressed: stepBack,
        ),
      ],
    );
  }
}