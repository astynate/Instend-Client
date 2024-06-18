import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/pages/main/account.dart';

void main() {
  runApp(const YexiderApplication());
}

class YexiderApplication extends StatelessWidget {
  const YexiderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccountPage(),
      color: Colors.black,
    );
  }
}

// Yexider Mobile Client.
// © Andreev S, 2024 — Minsk, Belarus.