import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final VoidCallback? iconOnPressed;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final bool obscureText;
  final bool showIcon;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.iconOnPressed,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showIcon = false,
    this.width,
    this.height,
    this.validator,
    this.textAlign = TextAlign.right,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: widget.width?.w,
              height: widget.height?.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                textAlign: widget.textAlign,
                cursorColor: AppColors.primaryColor,
                style: TextStyle(color: AppColors.darkA30, fontSize: 16.sp),
                validator: (value) {
                  final result = widget.validator?.call(value);
                  setState(() {
                    errorText = result;
                  });
                  return result;
                },
                decoration: InputDecoration(
                  fillColor: AppColors.lightColor,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: AppColors.lightA40),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),

                  suffixIcon:
                      widget.showIcon && widget.icon != null
                          ? Padding(
                            padding:  EdgeInsets.all(5.w),
                            child: MainIconButton(
                              icon: widget.icon!,
                              onPressed: widget.iconOnPressed,
                              showBackgroundColor: false,
                            ),
                          )
                          : null,
                  errorStyle: const TextStyle(
                    height: 0,
                    fontSize: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            if (errorText != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 4.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade700,
                      size: 18.sp,
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        errorText!,
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
