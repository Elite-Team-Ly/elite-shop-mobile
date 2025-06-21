import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_image_widget.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:120.h, horizontal: 20.w),
      child: Column(
        children: [
          CustomImageWidget(imagePath: image,width: 380.w,height: 253.h,fit: BoxFit.contain,),
          CustomText(
            title,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.dynamicColor(
              context: context,
              darkModeColor: AppColors.darkA30,
              lightModeColor: AppColors.darkA30,
            ),
          ),
          SizedBox(height: 12.h),
          CustomText(
            description,
            fontSize: 18.sp,
            fontWeight: FontWeight.w200,
            textAlign: TextAlign.center,
            color: AppColors.darkA40,
          ),
        ],
      ),
    );
  }
}
