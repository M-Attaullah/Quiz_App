import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A7BF7), // darker charming blue
          minimumSize: const Size(
            double.infinity,
            50,
          ), // fixed height for all buttons
          side: const BorderSide(color: Colors.white, width: 2), // white border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // consistent rounded shape
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
