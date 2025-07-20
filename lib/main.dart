import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App 💡',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(
          0xFF396BE9,
        ), // 🔵 your required color
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/result': (context) => const ResultScreen(score: 0),
      },
    );
  }
}
