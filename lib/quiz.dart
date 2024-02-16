import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import './start_screen.dart';
import './question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
/*
  Widget? activeScreen; //We cannot declare a variable with a type, without initialization. However, we need this as both
  StartScreen and QuestionsScreen are widgets, which need to be stored in a container that will allow state change.
  We cannot use 'var' as it will store a type of StartScreen, not Widget, which wouldn't allow QuestionsScreen to be stored in it.
  We couldn't use 'Widget activeScreen = StartScreen(switchScreen)', as both activeScreen and switchScreen are being created Simult.

  THE BELOW METHOD IS 1 WAY TO RENDER CONTENT CONDITIONALLY (USING INITSTATE)
  @override
  void initState() {
    The initState method is executed before the build method, but after object initialization.
    super.initState(); //compulsory
    activeScreen = StartScreen(
        switchScreen); //A pointer to switch screen is being sent to StartScreen
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
*/
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void answerQuestion(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(answerQuestion);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = const ResultsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 2, 83),
                Color.fromARGB(255, 121, 21, 208),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

/*activeScreen == 'start-screen'
? StartScreen(switchScreen)
: const QuestionsScreen()
*/