import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

void main() {
  runApp(const YexiderApplication());
}

class YexiderApplication extends StatelessWidget {
  const YexiderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          brightness: Brightness.dark
        )
      ),
      home: const AuthorizationPage(),
    );
  }
}

// Yexider Mobile Client.
// © Andreev S, 2024 — Minsk, Belarus.