import 'package:flutter/material.dart';
import 'package:quiz_app/screen/questions_screen.dart';
import 'package:quiz_app/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenWidget = activeScreen == 'start-screen'
     ? StartScreen(switchScreen) 
     : const QuestionsScreen();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 23, 1, 61),
                Color.fromARGB(255, 104, 29, 241),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}