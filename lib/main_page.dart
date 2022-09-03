import 'package:flutter/material.dart';
import 'constants.dart';
import 'data_helper.dart';
import 'showAverage.dart';
import 'lesson_list.dart';
import './model/lesson.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var formKey = GlobalKey<FormState>();
  double selectedValue = 1;
  double selectedCredit = 1;
  String incominLessonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              Center(child: Text(Constants.title, style: Constants.textStyle)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: createForm(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                    average: DataHelper.calculateAverage(),
                    numberofLesson: DataHelper.allAddedLessons.length,
                  ),
                ),
              ],
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index) {
                  setState(() {
                    DataHelper.allAddedLessons.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget createForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: createTextField(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: createLetterGrade(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: createCredits(),
                ),
              ),
              IconButton(
                onPressed: () {
                  addLessonAndCalculate();
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Constants.mainColor,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createTextField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          incominLessonName = value!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a lesson';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: ('Lesson'),
        filled: true,
        fillColor: Constants.mainColor.shade100,
      ),
    );
  }

  Widget createLetterGrade() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.5),
        borderRadius: Constants.radius,
      ),
      child: DropdownButton<double>(
        value: selectedValue,
        items: DataHelper.allLessonsLetter(),
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
          });
        },
      ),
    );
  }

  Widget createCredits() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.5),
          borderRadius: Constants.radius),
      child: DropdownButton<double>(
        value: selectedCredit,
        items: DataHelper.allCreditsList(),
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
          });
        },
      ),
    );
  }

  addLessonAndCalculate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var addLesson = Lesson(
        name: incominLessonName,
        letterGrade: selectedValue,
        credit: selectedCredit
      );
      DataHelper.addLesson(addLesson);
    }
  }
}