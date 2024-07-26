import 'package:flutter/material.dart';

class HomeSubPageTemplate extends StatelessWidget {
  final Widget widget;

  const HomeSubPageTemplate({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 14.0, right: 14.0),
      child: widget
    );
  }
}