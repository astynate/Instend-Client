import 'package:flutter/cupertino.dart';

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      style: const TextStyle(fontSize: 24.0)
    );
  }
}