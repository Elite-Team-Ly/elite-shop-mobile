import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDots extends StatelessWidget {
  final int currentPage;
  final int length;

  const OnboardingDots({
    super.key,
    required this.currentPage,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: currentPage == index ? 40.w : 30.w,
            height: 14.h,
            decoration: BoxDecoration(
              color:
                  currentPage == index
                      ? AppColors.primaryColor
                      : AppColors.primaryA40,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
