import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionsummary extends StatelessWidget {
  final List<Map<String, Object>> questionSummary;

  const Questionsummary(this.questionSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    const Color rightAnswer = Color.fromARGB(255, 38, 202, 43);
    const Color wrongAnswer = Color.fromARGB(255, 190, 25, 25);
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: questionSummary.map((element) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      color: (element['correctAnswer'] as String) ==
                              (element['seclectedAnswer'] as String)
                          ? rightAnswer
                          : wrongAnswer,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                    child: Text(
                      (((element['questionIndex'] as int) + 1)).toString(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element['question'] as String,
                        style: GoogleFonts.laila(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        element['correctAnswer'] as String,
                        style: const TextStyle(color: rightAnswer),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        element['seclectedAnswer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 193, 147, 147)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
