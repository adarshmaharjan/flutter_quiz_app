import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  String get resultPhrase {
    final String resultText;
    if (resultScore <= 8) {
      resultText = 'You did it and you are awesome and inncent';
    } else if (resultScore <= 12) {
      resultText = 'Preety likeable';
    } else {
      resultText = "You are strange";
    }

    return resultText;
  }

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text('Restart Quize'),
          )
        ],
      ),
    );
  }
}
