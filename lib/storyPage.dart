import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories/stories/story_1.dart';
import 'package:stories/stories/story_2.dart';
import 'package:stories/stories/story_3.dart';
import 'package:stories/utils/progress_bar.dart';
import 'package:stories/utils/storyBar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> MyStories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  List<double> percentAgeWatched = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < MyStories.length; i++) {
      percentAgeWatched.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        //only add 0.01 as long as its below 1
        if (percentAgeWatched[currentStoryIndex] + 0.01 < 1) {
          percentAgeWatched[currentStoryIndex] += 0.01;
        }
        //if adding 0.01 exceeds 1 ,set percentagewatched to 1 and cancel timer
        else {
          percentAgeWatched[currentStoryIndex] = 1;
          timer.cancel();

          //also go to next story as long as there are more story
          if (currentStoryIndex < MyStories.length - 1) {
            currentStoryIndex++;
            _startWatching();
          }

          //if we finish the last story then return to homepage
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double ScreenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    //if user tap on first half of screen
    if (dx < ScreenWidth / 2) {
      if (currentStoryIndex > 0) {
        percentAgeWatched[currentStoryIndex - 1] = 0;
        percentAgeWatched[currentStoryIndex] = 0;

        currentStoryIndex--;
      }
    }
    //user tapped on second half of screen
    else {
      setState(() {
        if (currentStoryIndex < MyStories.length - 1) {
          //finish current story
          percentAgeWatched[currentStoryIndex] = 1;
          //move to next story
          currentStoryIndex++;
        }
        //if user is on last story
        else {
          percentAgeWatched[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Stack(
          children: [
            //Stories
            MyStories[currentStoryIndex],
            //progress bar
            MyStoryBar(
              percentAgeWatched: percentAgeWatched,
            ),
          ],
        ),
      ),
    );
  }
}
