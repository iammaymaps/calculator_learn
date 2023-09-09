// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;

  final TextColor;

  final String buttonText;
  final buttonTap;

  MyButton({
    this.TextColor,
    this.color,
    required this.buttonText,
    this.buttonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: TextColor, fontSize: 30),
                ),
              ),
            )),
      ),
    );
  }
}
