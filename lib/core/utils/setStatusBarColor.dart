import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


void setSystemUIStyle(BuildContext context) {
  final backgroundColor = AppColors.dynamicColor(
    context: context,
    darkModeColor: AppColors.light_color,
    lightModeColor: AppColors.light_color,
  );

  final Brightness statusBarIconBrightness =
  MediaQuery.of(context).platformBrightness == Brightness.dark
      ? Brightness.dark
      : Brightness.dark;

  final Brightness navigationBarIconBrightness =
  MediaQuery.of(context).platformBrightness == Brightness.dark
      ? Brightness.dark
      : Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.primary_a50.withOpacity(0.1),
    statusBarIconBrightness:
    statusBarIconBrightness,
    systemNavigationBarColor:
    AppColors.primary_a50.withOpacity(0.0),
    systemNavigationBarIconBrightness:
    navigationBarIconBrightness,
    systemNavigationBarDividerColor:
    backgroundColor,
  ));
}
