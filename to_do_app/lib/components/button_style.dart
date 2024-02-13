import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback onPressed;
  final String text;
  Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
