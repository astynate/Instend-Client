import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAccountButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  late bool isLoading;

  MainAccountButton({
    super.key, 
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.90, 55),
      ),
      onPressed: () { if (isLoading == true) return; onPressed(); },
      child: isLoading == false ?
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        )
      :
        CupertinoActivityIndicator(color: textColor),
    );
  }
}