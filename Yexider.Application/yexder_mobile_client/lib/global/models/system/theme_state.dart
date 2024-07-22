import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/handlers/statusbar_handler.dart';

part 'theme_state.g.dart';

class ColorTheme = ColorThemeState with _$ColorTheme;

abstract class ColorThemeState with Store {
  final ThemeData accountServiceLightTheme = ThemeData(
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
      errorContainer: Colors.black,
      onErrorContainer: Colors.white,
      onSurface: Colors.white,
      brightness: Brightness.light,
    ),
  );

  final ThemeData accountServiceDarkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: Color(0xFF308fff),
      secondary: Color(0xFF222628),
      surface: Color.fromARGB(255, 0, 0, 0),
      error: Colors.redAccent,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Color(0xFF878D93),
      onSurface: Colors.white,
      errorContainer: Colors.white,
      onErrorContainer: Colors.black,
      brightness: Brightness.dark,
    ),
  );

  final ThemeData mainLightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: Color(0xFF308fff),
      secondary: Color(0xFFF4FAFE),
      surface: Color.fromARGB(255, 255, 255, 255),
      error: Colors.redAccent,
      onError: Colors.white,
      onPrimary: Color.fromARGB(255, 0, 0, 0),
      onSecondary: Color.fromARGB(255, 138, 145, 150),
      errorContainer: Colors.black,
      onErrorContainer: Colors.white,
      onSurface: Colors.white,
      brightness: Brightness.light,
    ),
  );

  final ThemeData mainDarkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: Color(0xffffffff),
      secondary: Color(0xFF16171B),
      surface: Color.fromARGB(255, 0, 0, 0),
      error: Colors.redAccent,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Color.fromARGB(255, 159, 159, 173),
      onSurface: Colors.white,
      errorContainer: Colors.white,
      onErrorContainer: Colors.black,
      brightness: Brightness.dark,
      tertiary: Color(0xFF454545),
      onTertiary: Color(0xFF595959)
    ),
  );

  @observable
  ThemeData? currentTheme;

  ColorThemeState() {
    currentTheme = accountServiceLightTheme;
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