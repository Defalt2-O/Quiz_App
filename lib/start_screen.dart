import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; //This is the switchScreen method from Quiz.
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(   This is another way to add opacity. Performance intensive so not recommended for big programs
          //   opacity: 0.1,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //To make outlined button accept icons, make it an outlinedbutton.icon widget,
          //which accepts an icon argument and a label argument(Instead of child)
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt_sharp),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ), //---This provides same look as TextStyle below, but used because this styling affects the icon also.
            label: const Text(
              'Start Quiz',
              // style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
