import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'data_helper.dart';
import 'model/lesson.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;

    if (allLessons.isNotEmpty) {
      return ListView.builder(
        itemCount: allLessons.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (value) {
              onDismiss(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(' ${allLessons[index].name} '),
                  leading: CircleAvatar(
                    backgroundColor: Constants.mainColor,
                    child:
                        Text(DataHelper.calculateAverage().toStringAsFixed(2)),
                  ),
                  subtitle: Text(
                      'Grade Value ${allLessons[index].letterGrade}, Credit Value ${allLessons[index].credit}'),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Center(
        child: Text(
          'Please enter a lesson',
          style: Constants.textStyle,
        ),
      );
    }
  }
}