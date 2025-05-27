import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData baseTheme = ThemeData(
  fontFamily: 'somar',
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.lightColor,
  buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColors.darkColor,
      fontFamily: 'somar',
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.darkColor,
      fontFamily: 'somar',
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      color: AppColors.darkA50,
      fontFamily: 'somar',
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: AppColors.darkA50,
      fontFamily: 'somar',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    titleTextStyle: TextStyle(
      color: AppColors.lightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'somar',
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
