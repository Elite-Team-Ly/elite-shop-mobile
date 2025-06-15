import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/routes.dart';
import '../../../widgets/app/app_logo_widget.dart';
import '../../../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 75.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLogo(
                  width: 210.w,
                  height: 216.h,
                ),
                AppNameText(fontSize: 48,),
                SizedBox(height: 32.h),
                MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.customerLogin);
                  },
                  borderRadius: BorderRadius.circular(18),
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),
                  width: 280.w,
                  height: 55.h,
                  child: CustomText("تسجيل دخول كمشتري",fontSize: 16,fontWeight: FontWeight.bold,),
                ),
                MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.customerLogin);
                  },
                  borderRadius: BorderRadius.circular(18),
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),
                  width: 280.w,
                  height: 55.h,
                  child: CustomText("تسجيل دخول كبائع",fontSize: 16,fontWeight: FontWeight.bold,),
                ),
                Text("ليس لديك حساب ؟", style: TextStyle(fontSize: 16.sp)),
                MainButton(
                  width: 130.w,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.signup);
                  },
                  child: Text("الأشتراك", style: TextStyle(fontSize: 12.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
