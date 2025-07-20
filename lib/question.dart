class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

final List<Question> questions = [
  Question(
    text: 'What is the capital of Pakistan?',
    options: ['Karachi', 'Lahore', 'Islamabad', 'Multan'],
    correctIndex: 2,
  ),
  Question(
    text: 'Which planet is known as the Red Planet?',
    options: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
    correctIndex: 1,
  ),
  Question(
    text: 'Who developed Flutter?',
    options: ['Facebook', 'Microsoft', 'Adobe', 'Google'],
    correctIndex: 3,
  ),
  Question(
    text: 'Which programming language is used by Flutter?',
    options: ['Java', 'Dart', 'Kotlin', 'Swift'],
    correctIndex: 1,
  ),
  Question(
    text: 'What is the currency of Japan?',
    options: ['Dollar', 'Yuan', 'Yen', 'Won'],
    correctIndex: 2,
  ),
];
