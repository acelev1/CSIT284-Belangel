import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('You answered X of Y questions correctly!'),
        const SizedBox(height: 25),
        const Text('List of answers and questions'),
        const SizedBox(height: 25),
        OutlinedButton(onPressed:
         () {},
         child: const Text('Restart Quiz!'),
         ),
      ],
    );
  }
}