import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextTabSelector extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final bool isFirstSelected;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const TextTabSelector({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.isFirstSelected,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildTab(
              label: firstLabel,
              isSelected: isFirstSelected,
              onTap: onFirstTap,
            ),
          ),
          SizedBox(width: 40.w),
          Expanded(
            child: _buildTab(
              label: secondLabel,
              isSelected: !isFirstSelected,
              onTap: onSecondTap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 24.sp,
              color: isSelected ? AppColors.primaryColor : AppColors.darkA50,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            margin: EdgeInsets.only(top: 4.h),
            height: 2.h,
            width: double.infinity,
            alignment: Alignment.center,
            child:
                isSelected
                    ? Container(
                      height: 2.h,
                      color: AppColors.primaryColor,
                      width: null,
                      constraints: BoxConstraints(
                        minWidth: 1,
                        maxWidth: double.infinity,
                      ),
                    )
                    : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
