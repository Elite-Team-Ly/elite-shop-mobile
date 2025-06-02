import 'package:flutter/material.dart';

class AppColors {
  // ======================================================
  // Primary Colors
  static const Color primaryColor = Color(0xff6895D9);
  static const Color primaryA10 = Color(0xff7BA0DD);
  static const Color primaryA20 = Color(0xff8DABE2);
  static const Color primaryA30 = Color(0xff9EB7E6);
  static const Color primaryA40 = Color(0xffAEC3EA);
  static const Color primaryA50 = Color(0xffBFCEEF);

  // ======================================================
  // Dark Colors
  static const Color darkColor = Color(0xff000000);
  static const Color darkA10 = Color(0xff121212);
  static const Color darkA20 = Color(0xff282828);
  static const Color darkA30 = Color(0xff3f3f3f);
  static const Color darkA40 = Color(0xff575757);
  static const Color darkA50 = Color(0xff8b8b8b);

  // ======================================================
  // Light Colors
  static const Color lightColor = Color(0xffffffff);
  static const Color lightA10 = Color(0xffEFEFEF);
  static const Color lightA20 = Color(0xffE2E2E2);
  static const Color lightA30 = Color(0xffBFBFBF);
  static const Color lightA40 = Color(0xff8C8C8C);
  static const Color lightA50 = Color(0xff575757);

  // Handler Color
  static const Color handlerColorBgSuccess = Color(0xffE8F5E9);
  static const Color handlerColorBgWarning = Color(0xffFFF8E1);
  static const Color handlerColorBgError = Color(0xffFFEBEE);
  static const Color handlerColorBgNetworkError = Color(0xffFFCDD2);
  static const Color handlerColorBgTimeout = Color(0xffF5F5F5);
  static const Color handlerColorBgServerError = Color(0xffFFEBEE);
  static const Color handlerColorBgInfo = Color(0xffE3F2FD);

  static const Color handlerColorTxtSuccess = Color(0xff2E7D32);
  static const Color handlerColorTxtWarning = Color(0xffFF8F00);
  static const Color handlerColorTxtError = Color(0xffC62828);
  static const Color handlerColorTxtNetworkError = Color(0xffB71C1C);
  static const Color handlerColorTxtTimeout = Color(0xff616161);
  static const Color handlerColorTxtServerError = Color(0xffB71C1C);
  static const Color handlerColorTxtInfo = Color(0xff1976D2);

  // ======================================================
  // Dynamic color helper
  static Color dynamicColor({
    required BuildContext context,
    required Color darkModeColor,
    required Color lightModeColor,
  }) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDarkMode ? darkModeColor : lightModeColor;
  }
}
class AuthEndpoints {
  static const signIn = "/signin";
  static const signUp = "/signup";
  static const sendOtp = "/sendVerifycode";
  static const verifyOtp = "/verifycode";
  static const resetPassword = "/resetpassword";
}

class AppLink {
 // static const String server = "http://api.eliteteam.com/api";
  static const String server = "http://5feh.l.time4vps.cloud:8080/api/auth";
  static const String imageServer = "http://studio.eliteteam.com:5000/image/";
}

class AppAssets {
  static const String app = "assets/app/";
  static const String lottie = "assets/lottie/";

  // logo app
  static const String logoApp = "assets/app/logo.png";
  static const String logoApp2 = "assets/app/logo2.png";
  static const String logoWidget = "assets/app/logoWidget.png";

  static const String customerLogin = "assets/app/loginBundle/customerLogin.png";
  static const String sellerLogin = "assets/app/loginBundle/SellerLogin.png";
}
