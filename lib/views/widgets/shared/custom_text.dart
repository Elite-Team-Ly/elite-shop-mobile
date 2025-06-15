import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;
  final TextBaseline? textBaseline;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize,
        this.color,
        this.fontWeight,
        this.fontStyle,
        this.textAlign,
        this.maxLines,
        this.decoration,
        this.overflow,
        this.letterSpacing,
        this.height,
        this.textBaseline,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize?.sp,
        color: color ?? AppColors.lightColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: fontStyle,
        decoration: decoration ,
        letterSpacing: letterSpacing,
        height: height,
        textBaseline: textBaseline,
      ),
    );
  }
}
