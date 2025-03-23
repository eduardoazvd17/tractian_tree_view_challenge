import 'package:flutter/material.dart';

Color get primaryColor => Color(0xFF2188FF);

ThemeData get lightTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    surface: Colors.white,
    brightness: Brightness.light,
  ),
  primaryColor: primaryColor,
  appBarTheme: _appBarTheme,
  useMaterial3: true,
);

ThemeData get darkTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    surface: Colors.black,
    brightness: Brightness.dark,
  ),
  primaryColor: primaryColor,
  appBarTheme: _appBarTheme,
  useMaterial3: true,
);

AppBarTheme get _appBarTheme => AppBarTheme(
  backgroundColor: Color(0xff17192D),
  foregroundColor: Colors.white,
);
