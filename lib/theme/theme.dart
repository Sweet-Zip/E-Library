import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white70,
    primary: Color(0xff00AEEF),
    secondary: Colors.grey,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Colors.black26,
    primary: Colors.green,
    secondary: Colors.grey,
  ),
);
