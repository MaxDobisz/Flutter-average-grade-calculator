import 'package:flutter/material.dart';
import './model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];

  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static List<String> letterGrade() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'CD', 'DD', 'FD', 'FF'];
  }

  static double? numberGrade(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'CD':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetter() {
    return letterGrade()
        .map(
          (e) => DropdownMenuItem(
            value: numberGrade(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List<int> allCredits() {
    return List.generate(15, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditsList() {
    return allCredits()
        .map((e) => DropdownMenuItem(
              value: e.toDouble(),
              child: Text(e.toString()),
            ))
        .toList();
  }

  static calculateAverage() {
    double totalGrade = 0;
    double totalCredit = 0;
    for (var element in allAddedLessons) {
      totalGrade = totalGrade + (element.credit * element.letterGrade);
      totalCredit = totalCredit + element.credit;
    }

    return totalGrade / totalCredit;
  }
}
