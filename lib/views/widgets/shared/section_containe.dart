import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double topRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AppSectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.topRadius = 24.0,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius.r),
          topRight: Radius.circular(topRadius.r),
        ),
      ),
      child: child,
    );
  }
}
