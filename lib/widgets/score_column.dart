import 'package:flutter/material.dart';

class ScoreColumn extends StatelessWidget {
  final int? homeScore;
  final int? awayScore;
  final double fontSize;

  const ScoreColumn(
      {super.key,
      required this.homeScore,
      required this.awayScore,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$homeScore - $awayScore',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
