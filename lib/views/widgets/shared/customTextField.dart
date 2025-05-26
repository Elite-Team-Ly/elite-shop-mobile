import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool showIcon;
  final double? width;
  final double? height;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showIcon = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.light_color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textAlign: showIcon ? TextAlign.right : TextAlign.center,
          cursorColor: AppColors.primary_color,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.light_a40),
            border: InputBorder.none,
            prefixIcon:
                showIcon && icon != null
                    ? Icon(icon, color: Colors.grey)
                    : null,
          ),
        ),
      ),
    );
  }
}
