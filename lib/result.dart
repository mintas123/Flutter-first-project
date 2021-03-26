import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore < 8) {
      resultText = resultText + ' \nYou are awesome and innocent.';
    } else if (resultScore < 13) {
      resultText = resultText + ' \nPretty good.';
    } else if (resultScore < 20) {
      resultText = resultText + ' \nYou\'re weirding me out.';
    } else {
      resultText = resultText + ' \nWTF is wrong with you.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text('Try Again'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
