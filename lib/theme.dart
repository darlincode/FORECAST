import 'package:flutter/material.dart';

/// Global App theme
/// Holds colors and styles

const Color textColorLightMode = darkGrey;
const Color textColorDarkMode = white;

const Color bgColorLightMode = white;
const Color bgColorDarkMode = darkGrey;

const Color cardColorLightMode = Color(0xFFAAAAAA);
const Color cardColorDarkMode = Color(0xFF000000);

// Text Styles
const TextStyle temperatureTextStyle = TextStyle(
  fontSize: 128,
);
const TextStyle unitsTextStyle = TextStyle(
  fontSize: 64,
);
const TextStyle bodyTextStyle = TextStyle();
const TextStyle bodyHeaderTextStyle = TextStyle();
const TextStyle drawerHeaderTextStyle = TextStyle(
  fontSize: 24,
  fontFamily: 'CarroisSC',
);
const TextStyle drawerSubtitleTextStyle = TextStyle(
  fontSize: 16,
);
const TextStyle settingsButtonStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'CarroisSC',
);

// Colors
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color green = Color(0xFF00FF00);
const Color blue = Color(0xFF0000FF);
const Color red = Color(0xFFFF0000);
const Color grey = Color(0xFF808080);
const Color lightGrey = Color(0xFFDDDDDD);
const Color darkGrey = Color(0xFF202020);
