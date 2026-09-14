import 'package:flutter/material.dart';
import 'package:quiz_app/screen/start_screen.dart';
 
void main() {
  runApp(
    MaterialApp(
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
          child: const StartScreen(),
        ),
      ),
    ),
  );
}