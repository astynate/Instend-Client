import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AccountButtonTypes {
  primary,
  secondary
}

class MainAccountButton extends StatelessWidget {
  final String text;
  late Color textColor;
  late Color backgroundColor;
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

  MainAccountButton.specificObject({
    super.key, 
    required AccountButtonTypes type, 
    required BuildContext context,
    required this.text, 
    required this.onPressed, 
    this.isLoading = false
  }) {
    switch(type) {
      case AccountButtonTypes.primary:
        textColor = const Color.fromARGB(255, 255, 255, 255);
        backgroundColor = Theme.of(context).colorScheme.primary;
        break;
      case AccountButtonTypes.secondary:
        textColor = Theme.of(context).colorScheme.onSecondary;
        backgroundColor = const Color.fromARGB(0, 0, 0, 0).withOpacity(0.0);
        break;
    }  
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width > 360 ? 350 : 
      MediaQuery.of(context).size.width * 0.90;

    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(textColor),
        backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
        minimumSize: WidgetStateProperty.all<Size>(Size(size, 50)),
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