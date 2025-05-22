import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/statusHandler.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isEnabled;
  final String status;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isEnabled = true,
    this.status = 'normal',
  });

  @override
  Widget build(BuildContext context) {
    final AppStatus appStatus = parseAppStatus(status);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 80, maxWidth: 220,minHeight: 33, maxHeight: 50),
      child: IntrinsicWidth(
        child: RawMaterialButton(
          onPressed: isEnabled ? onPressed : null,
          fillColor: AppStatusHandler.backgroundColor(
            appStatus,
            isEnabled: isEnabled,
          ),
          splashColor: isEnabled ? AppColors.primary_a50 : Colors.transparent,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: isEnabled ? 0 : 0,
          disabledElevation: 0,
          child: DefaultTextStyle(
            style: TextStyle(
              color: AppStatusHandler.textColor(
                appStatus,
                isEnabled: isEnabled,
              ),
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
