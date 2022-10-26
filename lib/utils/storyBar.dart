import 'package:flutter/material.dart';
import 'package:stories/utils/progress_bar.dart';

class MyStoryBar extends StatelessWidget {
  List<double> percentAgeWatched = [];
  MyStoryBar({super.key, required this.percentAgeWatched});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentAgeWatched: percentAgeWatched[0]),
          ),
          Expanded(
            child: MyProgressBar(percentAgeWatched: percentAgeWatched[1]),
          ),
          Expanded(
            child: MyProgressBar(percentAgeWatched: percentAgeWatched[2]),
          ),
        ],
      ),
    );
  }
}
