import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/status_handler.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Widget child;
  final bool isEnabled;
  final String status;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isEnabled = true,
    this.status = 'normal',
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final AppStatus appStatus = parseAppStatus(status);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SizedBox(
        width: (width ?? 130).w,
        height: (height ?? 40).h,
        child: RawMaterialButton(
          onPressed: isEnabled ? onPressed : null,
          fillColor: AppStatusHandler.backgroundColor(
            appStatus,
            isEnabled: isEnabled,
          ),
          splashColor: isEnabled ? AppColors.primaryA50 : Colors.transparent,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          disabledElevation: 0,
          child: DefaultTextStyle(
            style: TextStyle(
              color: AppStatusHandler.textColor(
                appStatus,
                isEnabled: isEnabled,
              ),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class MainIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double? width;
  final double? height;
  final double iconSize;
  final bool isEnabled;
  final bool showBackgroundColor;
  final Color? backgroundColor;

  const MainIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
    this.iconSize = 20,
    this.showBackgroundColor = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width ?? 48).w,
      height: (height ?? 48).h,
      child: RawMaterialButton(
        onPressed: isEnabled ? onPressed : null,
        fillColor:
            showBackgroundColor
                ? (backgroundColor ?? AppColors.lightColor)
                : Colors.transparent,
        splashColor: isEnabled ? AppColors.primaryA50 : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
        disabledElevation: 0,
        child: Icon(icon, size: iconSize, color: AppColors.primaryColor),
      ),
    );
  }
}

class MainTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;

  const MainTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.decoration,
    this.textAlign = TextAlign.center,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: color ?? AppColors.primaryColor,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            decoration: decoration ?? TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
