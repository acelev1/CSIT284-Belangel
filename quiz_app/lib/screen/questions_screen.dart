import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currrentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currrentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currrentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        constraints: const BoxConstraints(maxWidth: 350),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold, 
               ),
               ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer, 
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}