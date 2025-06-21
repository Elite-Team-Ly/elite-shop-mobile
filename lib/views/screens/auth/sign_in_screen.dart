import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/app/pattern_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/routes.dart';
import '../../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PatternBackground(
        child: Padding(
          padding: EdgeInsets.only(
            top: 200.h,
            bottom: 40.h,
            right: 75.w,
            left: 75.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(width: 200.w, height: 200.h),
              AppNameText(fontSize: 38),
              SizedBox(height: 32.h),
              MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.buyerLogin);
                },
                borderRadius: BorderRadius.circular(18),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
                width: 280.w,
                height: 55.h,
                child: CustomText(
                  "تسجيل دخول كمشتري",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.sellerLogin);
                },
                borderRadius: BorderRadius.circular(18),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
                width: 280.w,
                height: 55.h,
                color: AppColors.lightColor,
                borderColor: AppColors.darkA50,
                child: CustomText(
                  "تسجيل دخول كبائع",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
              RowWithAction(
                normalWidget: CustomText(
                  "ليس لديك حساب",
                  fontSize: 20.sp,
                  color: AppColors.darkA30,
                ),
                actionWidget: CustomText(
                  "انشاء حساب",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                onActionTap: () {
                  Navigator.pushNamed(context, RouteNames.signup);
                },
              ),
              Spacer(),
              CenteredSvgIconRow(
                svgPaths: [
                  AppAssets.facebook,
                  AppAssets.whatsapp,
                  AppAssets.instagram,
                ],
                iconSize: 28.sp,
                onTap: (index) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
