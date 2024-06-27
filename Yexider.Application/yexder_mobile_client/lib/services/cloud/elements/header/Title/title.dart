import 'package:flutter/cupertino.dart';

class SettingsTitle extends StatelessWidget {
  final String title;

  const SettingsTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)
    );
  }
}