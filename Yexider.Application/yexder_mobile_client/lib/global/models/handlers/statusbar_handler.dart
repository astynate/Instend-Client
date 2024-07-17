import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusbarHandler {
  static void setLightTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
      statusBarColor: Colors.transparent),
    );
  }

  static void setDarkTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
      statusBarColor: Colors.transparent),
    );
  }
}