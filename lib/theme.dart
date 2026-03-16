import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xff22A447),
    secondary: Color(0xff159A46),
    surface: Color(0xffF5F6FA),
  ),
  primaryColor: const Color(0xff22A447),
  scaffoldBackgroundColor: const Color(0xffF5F6FA),
  cardColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff22A447),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0x00000000),
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
);