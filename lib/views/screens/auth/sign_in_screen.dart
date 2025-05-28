import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/routes.dart';
import '../../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(
                width: 160.w,
                height: 167.h,
              ),
              SizedBox(height: 50.h),
              MultiContentBoxWidget(
                width: double.infinity.w,
                children: [
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.customerLogin);
                    },
                    width: 180.w,
                    child: Text("تسجيل دخول كمشتري"),
                  ),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.sellerLogin);
                    },
                    width: 180.w,
                    child: Text("تسجيل دخول كبائع"),
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
            ],
          ),
        ),
      ),
    );
  }
}
