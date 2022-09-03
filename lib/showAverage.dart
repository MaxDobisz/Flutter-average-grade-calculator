import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberofLesson;
 
  const ShowAverage(
      {required this.average, required this.numberofLesson, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberofLesson > 0
              ? '$numberofLesson Lesson'
              : 'Please ebeter lesson',
          style: Constants.lessonStyle,
        ),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : '0.0',
          style: Constants.averageStyle,
        ),
        Text(
          'Average',
          style: Constants.lessonStyle,
        ),
      ],
    );
  }
}