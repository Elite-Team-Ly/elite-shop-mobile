import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData baseTheme = ThemeData(
  fontFamily: 'somar',
  primaryColor: AppColors.primary_color,
  scaffoldBackgroundColor: AppColors.light_color,
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primary_color,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColors.dark_color,
      fontFamily: 'somar',
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.dark_color,
      fontFamily: 'somar',
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      color: AppColors.dark_a50,
      fontFamily: 'somar',
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: AppColors.dark_a50,
      fontFamily: 'somar',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary_color,
    titleTextStyle: TextStyle(
      color: AppColors.light_color,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'somar',
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
