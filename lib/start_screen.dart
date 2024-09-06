import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
   final void Function() startQuestions;

  const StartScreen(this.startQuestions,{super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              onPressed: startQuestions,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt_outlined),
              label: const Text(
                'Start Quiz',
              ))
        ],
      ),
    );
  }
}
