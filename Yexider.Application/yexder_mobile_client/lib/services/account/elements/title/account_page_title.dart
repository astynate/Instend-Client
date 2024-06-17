import 'package:flutter/material.dart';

class AccountPageTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const AccountPageTitle({
    super.key,
    required this.text,
    this.fontSize = 28.0,
    this.color = const Color.fromARGB(255, 255, 255, 255),
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}