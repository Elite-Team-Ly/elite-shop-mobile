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
      margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
