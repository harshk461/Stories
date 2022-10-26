import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stories/storyPage.dart';
import 'package:stories/utils/story_circle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _openStory() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StoryPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S T O R I E S"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    );
                  } else {
                    return StoryCircle(function: _openStory);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
