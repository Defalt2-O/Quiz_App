import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(questions[0].text, style: const TextStyle(color: Colors.white)),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(questions[0].answers[0], () {}),
          AnswerButton(questions[0].answers[1], () {}),
          AnswerButton(questions[0].answers[2], () {}),
          AnswerButton(questions[0].answers[3], () {}),
        ],
      ),
    );
  }
}
