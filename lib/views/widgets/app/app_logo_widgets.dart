import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final bool withShadow;

  const AppLogo({
    super.key,
    this.width = 200.0,
    this.height = 200.0,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.borderRadius,
    this.backgroundColor,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: height?.h,
      margin: margin,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: withShadow
            ? [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.r,
            offset: Offset(0, 2),
          ),
        ]
            : [],
      ),
      child: Image.asset(
        AppAssets.logoWidget,
        fit: fit,
      ),
    );
  }
}
