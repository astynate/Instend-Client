import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

void main() {
  runApp(const YexiderApplication());
}

class YexiderApplication extends StatelessWidget {
  final MaterialColor color = MaterialColor(1, Mapconst <int, Color> {0, Colors.white});

  const YexiderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(
            secondary: Colors.white,
            brightness: Brightness.dark,
          ),
      ),
      home: const AuthorizationPage(),
    );
  }
}

// Yexider Mobile Client.
// © Andreev S, 2024 — Minsk, Belarus.