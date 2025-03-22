import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    surface: Colors.white,
    brightness: Brightness.light,
  ),
  appBarTheme: _appBarTheme,
  useMaterial3: true,
);

ThemeData get darkTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    surface: Colors.black,
    brightness: Brightness.dark,
  ),
  appBarTheme: _appBarTheme,
  useMaterial3: true,
);

AppBarTheme get _appBarTheme => AppBarTheme(
  backgroundColor: Color(0xff17192D),
  foregroundColor: Colors.white,
);
