import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? screenState;
  List<String> selectedAnswers = [];

  List<Map<String, Object>> getDataSummary() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'seclectedAnswer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  void initState() {
    super.initState();
    screenState = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      screenState = QuestionsScreen(addAnswer);
    });
  }

  void addAnswer(answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        screenState = ResultsScreen(getDataSummary(), resetQuiz);
      });
    }
  }

  void resetQuiz() {
    selectedAnswers = [];
    setState(() {
      screenState = QuestionsScreen(addAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 27, 33, 210),
            Color.fromARGB(255, 16, 18, 137),
            Color.fromARGB(255, 32, 35, 135)
          ])),
          child: screenState,
        ),
      ),
    );
  }
}
