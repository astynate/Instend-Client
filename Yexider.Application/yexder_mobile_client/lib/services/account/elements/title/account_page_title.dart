import 'package:flutter/material.dart';

class AccountPageTitle extends StatelessWidget {
  final String text;

  const AccountPageTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.w800,
        decoration: TextDecoration.none,
      ),
    );
  }
}