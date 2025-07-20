import 'package:flutter/material.dart';
import 'dart:async';
import 'question.dart';
import 'option_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  int secondsLeft = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsLeft = 10;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          nextQuestion();
        }
      });
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        startTimer();
      });
    } else {
      timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: score)),
      );
    }
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentIndex].correctIndex) {
      score++;
    }
    nextQuestion();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF396BE9),
        title: const Text(
          'Quiz App💡',
          style: TextStyle(
            color: Color.fromARGB(252, 236, 236, 236),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF396BE9),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              q.text,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ...q.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return OptionButton(
                text: option,
                onPressed: () => checkAnswer(idx),
              );
            }),
            const Spacer(),
            Center(
              child: Text(
                'Time Left: $secondsLeft s',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 230, 0), // 🔔 to stand out
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
