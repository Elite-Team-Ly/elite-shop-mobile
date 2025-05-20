import 'package:flutter/material.dart';

class AppColors {
  // ======================================================
  // Primary Colors 
  static const Color primary_color = Color.fromARGB(255, 81, 100, 130);
  static const Color primary_a10 = Color(0xff7288ad);
  static const Color primary_a20 = Color(0xff8396b7);
  static const Color primary_a30 = Color(0xff94a4c1);
  static const Color primary_a40 = Color(0xffa6b3cb);
  static const Color primary_a50 = Color(0xffb7c2d6);

  // ======================================================
  // Dark Colors 
  static const Color dark_color = Color(0xff000000);
  static const Color dark_a10 = Color(0xff121212);
  static const Color dark_a20 = Color(0xff282828);
  static const Color dark_a30 = Color(0xff3f3f3f);
  static const Color dark_a40 = Color(0xff575757);
  static const Color dark_a50 = Color(0xff8b8b8b);

  // ======================================================
  // Light Colors
  static const Color light_color = Color(0xffffffff);
  static const Color light_a10 = Color(0xffededed);
  static const Color light_a20 = Color(0xffc8c8c8);
  static const Color light_a30 = Color(0xff8a8a8a);
  static const Color light_a40 = Color(0xff3e3e3e);
  static const Color light_a50 = Color(0xff222222);

  // ======================================================
  // Dynamic color helper
  static Color dynamicColor({
    required BuildContext context,
    required Color darkModeColor,
    required Color lightModeColor,
  }) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDarkMode ? darkModeColor : lightModeColor;
  }
}


class AppLink {
  static const server = "http://api.eliteteam.com/api";
  static const imageServer = "http://studio.eliteteam.com:5000/image/";

}