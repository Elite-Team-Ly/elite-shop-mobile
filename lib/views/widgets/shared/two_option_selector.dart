import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwoOptionSelector extends StatelessWidget {
  final String? label;
  final String firstOption;
  final String secondOption;
  final String firstValue;
  final String secondValue;
  final ValueNotifier<String> selectedOptionNotifier;
  final void Function(String)? onChanged;

  const TwoOptionSelector({
    super.key,
    this.label,
    required this.firstOption,
    required this.secondOption,
    required this.firstValue,
    required this.secondValue,
    required this.selectedOptionNotifier,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(bottom: 26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, right: 8.w),
              child: Text(
                label ?? '',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkA20,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: selectedOptionNotifier,
              builder: (context, selectedValue, _) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOption(
                        label: firstOption,
                        value: firstValue,
                        selectedValue: selectedValue,
                      ),
                      SizedBox(width: 12.w),
                      _buildOption(
                        label: secondOption,
                        value: secondValue,
                        selectedValue: selectedValue,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String label,
    required String value,
    required String selectedValue,
  }) {
    final bool isSelected = value == selectedValue;

    return GestureDetector(
      onTap: () {
        selectedOptionNotifier.value = value;
        if (onChanged != null) onChanged!(value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lightColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.lightA20,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
