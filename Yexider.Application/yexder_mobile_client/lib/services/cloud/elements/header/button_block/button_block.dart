import 'package:flutter/material.dart';

class ButtonBlock extends StatelessWidget {
  final List<ButtonElement> buttons;

  const ButtonBlock({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 60, 60, 60),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buttons,
      ),
    );
  }
}

class ButtonElement extends StatelessWidget {
  final String title;

  const ButtonElement({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide())
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
          child: Text(title, style: const TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}
