import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionSummary.dart';

class ResultsScreen extends StatelessWidget {
  final List<Map<String, Object>> questionSummary;

  const ResultsScreen(this.questionSummary, this.resetQuiz, {super.key});

  final void Function() resetQuiz;
  @override
  Widget build(BuildContext context) {
    final int numTotalQuestions = questions.length;
    final int numCorrectAnswers = questionSummary.where((element) {
      return element["seclectedAnswer"] == element["correctAnswer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you get $numCorrectAnswers right questions out of $numTotalQuestions questions',
              style: GoogleFonts.laila(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Questionsummary(questionSummary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                icon: const Icon(Icons.settings_backup_restore_outlined),
                onPressed: resetQuiz,
                label: const Text(
                  'Restart Quiz!',
                ))
          ],
        ),
      ),
    );
  }
}
