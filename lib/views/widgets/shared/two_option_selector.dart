import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwoOptionSelector extends StatelessWidget {
  final String firstOption;
  final String secondOption;
  final ValueNotifier<String> selectedOptionNotifier;
  final void Function(String)? onChanged;

  const TwoOptionSelector({
    super.key,
    required this.firstOption,
    required this.secondOption,
    required this.selectedOptionNotifier,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedOptionNotifier,
      builder: (context, selectedOption, _) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOption(firstOption, selectedOption),
              SizedBox(width: 12.w),
              _buildOption(secondOption, selectedOption),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(String option, String selectedOption) {
    final bool isSelected = option == selectedOption;

    return GestureDetector(
      onTap: () {
        selectedOptionNotifier.value = option;
        if (onChanged != null) onChanged!(option);
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
          option,
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
