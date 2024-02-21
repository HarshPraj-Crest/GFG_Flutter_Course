import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.selectHandler,
    required this.answerText,
  });

  final VoidCallback selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 157, 241, 160))),
        child: Text(answerText),
      ),
    );
  }
}
