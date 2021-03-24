import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handler;
  final String label;

  Answer({this.label, this.handler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        // color: Colors.blue,
        child: Text(label),
        onPressed: handler,
      ),
    );
  }
}
