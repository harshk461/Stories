import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  double percentAgeWatched;
  MyProgressBar({super.key, required this.percentAgeWatched});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 15,
      percent: percentAgeWatched,
      progressColor: Colors.grey[200],
      backgroundColor: Colors.grey[680],
    );
  }
}
