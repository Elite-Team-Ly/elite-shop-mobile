 import 'package:flutter/material.dart';

class AppColors {
  // ======================================================
  // Primary Colors
  static const Color primary_color = Color(0xff6895D9);
  static const Color primary_a10 = Color(0xff7BA0DD);
  static const Color primary_a20 = Color(0xff8DABE2);
  static const Color primary_a30 = Color(0xff9EB7E6);
  static const Color primary_a40 = Color(0xffAEC3EA);
  static const Color primary_a50 = Color(0xffBFCEEF);

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
  static const Color light_a10 = Color(0xffEFEFEF);
  static const Color light_a20 = Color(0xffE2E2E2);
  static const Color light_a30 = Color(0xffBFBFBF);
  static const Color light_a40 = Color(0xff8C8C8C);
  static const Color light_a50 = Color(0xff575757);

  // Handler Color
  static const Color handler_color_BG_Success = Color(0xffE8F5E9);
  static const Color handler_color_BG_Warning = Color(0xffFFF8E1);
  static const Color handler_color_BG_Error = Color(0xffFFEBEE);
  static const Color handler_color_BG_NetworkError  = Color(0xffFFCDD2);
  static const Color handler_color_BG_Timeout = Color(0xffF5F5F5);
  static const Color handler_color_BG_ServerError = Color(0xffFFEBEE);
  static const Color handler_color_BG_Info = Color(0xffE3F2FD);

  static const Color handler_color_Txt_Success = Color(0xff2E7D32);
  static const Color handler_color_Txt_Warning = Color(0xffFF8F00);
  static const Color handler_color_Txt_Error = Color(0xffC62828);
  static const Color handler_color_Txt_NetworkError = Color(0xffB71C1C);
  static const Color handler_color_Txt_Timeout = Color(0xff616161);
  static const Color handler_color_Txt_ServerError = Color(0xffB71C1C );
  static const Color handler_color_Txt_Info = Color(0xff1976D2);

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


class AppAssets {
  static const String app = "assets/app/";
  static const String lottie = "assets/lottie/";

  // logo app
  static const String logoApp = "assets/app/logo.png";
  static const String logoApp_2 = "assets/app/logo2.png";
  static const String logoWidget = "assets/app/logoWidget.png";

}