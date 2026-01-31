import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: "ClarendonBold",
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF7FFF00),
    onPrimary: Colors.white,
    secondary: Color(0xFF181818),
    onSecondary: Colors.white,
    error: Color(0xFF7FFF00),
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  fontFamily: "ClarendonBold",
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF7FFF00),
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Color(0xFF7FFF00),
    onError: Colors.black,
    surface: Color(0xFF181818),
    onSurface: Colors.white,
  ),
);
