import 'package:flutter/material.dart';

/// Global App theme
/// Holds colors and styles
@immutable
class AppTheme {
  // Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color red = Color(0xFFFF0000);

  static const Color textColorLightMode = Color(0xFF101010);
  static const Color textColorDarkMode = Color(0xFFDDDDDD);

  static const Color bgColorLightMode = Color(0xFFFFFFFF);
  static const Color bgColorDarkMode = Color(0xFF151515);

  static const Color cardColorLightMode = Color(0xFFAAAAAA);
  static const Color cardColorDarkMode = Color(0xFF000000);

  // Text Styles
  static const TextStyle temperatureTextStyle = TextStyle();
  static const TextStyle bodyTextStyle = TextStyle();
  static const TextStyle bodyHeaderTextStyle = TextStyle();
}
