import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color borderColor;
  final double size;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.borderColor = Colors.grey,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          color:
              value
                  ? activeColor ?? AppColors.primaryColor
                  : Colors.transparent,
          border: Border.all(
            color: value ? activeColor ?? AppColors.primaryColor : borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child:
            value
                ? Icon(Icons.check, size: size * 0.7, color: Colors.white)
                : null,
      ),
    );
  }
}
