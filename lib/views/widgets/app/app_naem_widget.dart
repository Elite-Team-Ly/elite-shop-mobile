import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/constants.dart';

class AppNameText extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final bool withShadow;

  const AppNameText({
    super.key,
    this.fontSize = 32,
    this.fontWeight = FontWeight.bold,
    this.color,
    this.textAlign = TextAlign.center,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Elite Shop",
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color ?? AppColors.primaryColor,
        shadows: withShadow
            ? [
          Shadow(
            color: Colors.black26,
            blurRadius: 6.r,
            offset: Offset(1.5, 1.5),
          ),
        ]
            : [],
        letterSpacing: 1.2,
      ),
    );
  }
}
