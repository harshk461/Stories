import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;
  StoryCircle({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
    ;
  }
}
