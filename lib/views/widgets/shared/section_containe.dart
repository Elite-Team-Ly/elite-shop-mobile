import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elite_team_training_app/core/config/constants.dart';

class AppSectionContainer extends StatelessWidget {
  final Color? backgroundColor;
  final double topRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Widget> children;

  const AppSectionContainer({
    super.key,
    this.backgroundColor,
    this.topRadius = 24.0,
    this.padding,
    this.margin,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.lightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topRadius.r),
            topRight: Radius.circular(topRadius.r),
          ),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(  vertical: 16.h),
          child: ListView.builder(
            itemCount: children.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => children[index],
          ),
        ),
      ),
    );
  }
}
