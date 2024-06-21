import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        brightness: Brightness.dark,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const AuthorizationPage(),
    );
  }
}

// Yexider Mobile Client.
// © Andreev S, 2024 — Minsk, Belarus.