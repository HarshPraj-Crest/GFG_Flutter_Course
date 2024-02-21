import 'package:flutter/material.dart';
import 'package:gfg_quiz/answer.dart';
import 'package:gfg_quiz/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              selectHandler: () => answerQuestion(answer['score'] as int),
              answerText: answer['text'].toString());
        }).toList()
      ],
    );
  }
}
