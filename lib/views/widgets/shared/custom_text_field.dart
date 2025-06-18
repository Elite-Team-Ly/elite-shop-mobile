import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final IconData? icon;
  final VoidCallback? iconOnPressed;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final bool obscureText;
  final bool showIcon;
  final bool? isPhoneNumber;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.icon,
    this.iconOnPressed,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showIcon = false,
    this.width,
    this.height,
    this.validator,
    this.isPhoneNumber = false,
    this.textAlign = TextAlign.right,
    this.readOnly,
    this.onTap,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 6.h),
                child: Text(
                  widget.title!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: hasError ? AppColors.handlerColorTxtError : AppColors.darkA10,
                  ),
                ),
              ),
            Container(
              width: widget.width?.w,
              height: widget.height?.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                readOnly: widget.readOnly ?? false,
                onTap: widget.onTap,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                textAlign: widget.textAlign,
                maxLength: widget.isPhoneNumber == true ? 10 : null,
                cursorColor: hasError ? AppColors.handlerColorTxtError : AppColors.primaryColor,
                style: TextStyle(
                  color: hasError ? AppColors.handlerColorTxtError : AppColors.darkA30,
                  fontSize: 16.sp,
                ),
                onChanged: (value) {
                  if (hasError) {
                    setState(() => hasError = false);
                  }
                  widget.onChanged?.call(value);
                },
                validator: (value) {
                  final result = widget.validator?.call(value);
                  setState(() {
                    errorText = result;
                    hasError = result != null;
                  });
                  return result;
                },
                decoration: InputDecoration(
                  fillColor: AppColors.lightColor,
                  counterText: '',
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: hasError ? AppColors.handlerColorTxtError.withAlpha((0.4 * 255).round()) : AppColors.lightA40,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: hasError ? AppColors.handlerColorTxtError : AppColors.darkA50,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: hasError ? AppColors.handlerColorTxtError : AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.handlerColorTxtError,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.handlerColorTxtError,
                      width: 2,
                    ),
                  ),
                  suffixIcon: widget.showIcon && widget.icon != null
                      ? Padding(
                    padding: EdgeInsets.all(5.w),
                    child: MainIconButton(
                      icon: widget.icon!,
                      onPressed: widget.iconOnPressed,
                      showBackgroundColor: false,
                      iconColor: hasError ? AppColors.handlerColorTxtError : null,
                    ),
                  )
                      : null,
                  errorStyle: const TextStyle(height: 0, fontSize: 0),
                ),
              ),
            ),
            if (errorText != null && hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, right: 8.w),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: AppColors.handlerColorTxtError,
                    fontSize: 14.sp,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}