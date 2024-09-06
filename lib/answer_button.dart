import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const AnswerButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 69, 3, 190),
            foregroundColor: Colors.white),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}
