import 'package:flutter/material.dart';
 
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          color:Colors.deepPurple,
          ),
          child: Center(
            child: Column(mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',
              width: 180,
              ),
              const SizedBox(height: 30), const Text('Learn Flutter the fun way!',
                style: TextStyle(
                fontSize: 24,fontWeight: FontWeight.bold, color:Colors.white,
                ),
              ),
              const SizedBox(height:30),
              ElevatedButton(onPressed: () {}, child: const Text('Start Quiz',style: TextStyle(fontSize: 18,)))
            ],
            )
          )
        ),
      ),
    ),
  );
}