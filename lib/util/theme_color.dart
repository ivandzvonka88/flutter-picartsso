import 'package:flutter/material.dart';

class ColorTheme {
  static const MaterialColor mainTheme =
      MaterialColor(_mainThemePrimaryValue, <int, Color>{
    50: Color(0xFFECECEC),
    100: Color(0xFFD0D0D0),
    200: Color(0xFFB1B1B1),
    300: Color(0xFF929292),
    400: Color(0xFF7A7A7A),
    500: Color(_mainThemePrimaryValue),
    600: Color(0xFF5B5B5B),
    700: Color(0xFF515151),
    800: Color(0xFF474747),
    900: Color(0xFF353535),
  });
  static const int _mainThemePrimaryValue = 0xFF636363;

  static const MaterialColor mainThemeAccent =
      MaterialColor(_mainThemeAccentValue, <int, Color>{
    100: Color(0xFFF49898),
    200: Color(_mainThemeAccentValue),
    400: Color(0xFFFF2727),
    700: Color(0xFFFF0E0E),
  });
  static const int _mainThemeAccentValue = 0xFFEF6B6B;
}
