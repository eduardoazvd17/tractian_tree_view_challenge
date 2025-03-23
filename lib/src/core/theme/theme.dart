import 'package:flutter/material.dart';

Color get primaryColor => Color(0xFF2188FF);
Color get commonColor => Color(0xFFEAEFF3);

ThemeData get lightTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    surface: Colors.white,
    shadow: commonColor,
    brightness: Brightness.light,
  ),
  primaryColor: primaryColor,
  shadowColor: commonColor,
  dividerColor: commonColor,
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  useMaterial3: true,
);

AppBarTheme get _appBarTheme => AppBarTheme(
  backgroundColor: Color(0xff17192D),
  foregroundColor: Colors.white,
);

InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
  filled: true,
  fillColor: commonColor,
  contentPadding: EdgeInsets.zero,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(4),
  ),
);
