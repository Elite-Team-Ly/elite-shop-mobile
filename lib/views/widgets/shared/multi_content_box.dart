import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiContentBoxWidget extends StatelessWidget {
  final List<Widget> children;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? backgroundColor;
  final BoxShadow? boxShadow;

  const MultiContentBoxWidget({
    super.key,
    required this.children,
    this.width = 240,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.backgroundColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width?.w,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: padding ?? EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: backgroundColor ??
              AppColors.dynamicColor(
                context: context,
                darkModeColor: AppColors.darkA10,
                lightModeColor: AppColors.lightA10,
              ),
          borderRadius: BorderRadius.circular(borderRadius!.r),
          boxShadow: [
            boxShadow ??
                BoxShadow(
                  color: AppColors.lightA20,
                  offset: Offset(0, 8.h),
                  blurRadius: 10.r,
                ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
