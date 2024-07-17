import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/handlers/statusbar_handler.dart';

part 'theme_state.g.dart';

class ColorTheme = ColorThemeState with _$ColorTheme;

abstract class ColorThemeState with Store {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: Color(0xFF308fff),
      secondary: Color(0xFFF4FAFE),
      surface: Color.fromARGB(255, 255, 255, 255),
      error: Colors.redAccent,
      onError: Colors.white,
      onPrimary: Color.fromARGB(255, 0, 0, 0),
      onSecondary: Color(0xFFC7D2DA),
      onSurface: Colors.white,
      brightness: Brightness.light,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: Color(0xFF308fff),
      secondary: Color.fromARGB(255, 46, 47, 48),
      surface: Color.fromARGB(255, 0, 0, 0),
      error: Colors.redAccent,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Color(0xFFC7D2DA),
      onSurface: Colors.white,
      brightness: Brightness.dark,
    ),
  );

  @observable
  ThemeData? currentTheme;

  ColorThemeState() {
    currentTheme = lightTheme;
  }

  @action
  void setColorMode(ThemeData themeData) {
    if (themeData.brightness == Brightness.light) {
      StatusbarHandler.setLightTheme();
    } else {
      StatusbarHandler.setDarkTheme();
    }

    currentTheme = themeData;
  }
}

ColorTheme colorTheme = ColorTheme();