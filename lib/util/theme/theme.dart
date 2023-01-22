import 'package:flutter/material.dart';

class MedAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
