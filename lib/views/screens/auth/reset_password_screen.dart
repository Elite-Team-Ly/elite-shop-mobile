import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "اعاادة تعيين كلمة المرور",
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 100.h),
              child: MultiContentBoxWidget(
                width: 300.w,
                children: [
                  CustomText(
                    "الرجاء ادخل رقم الهاتف",
                    fontSize: 22.sp,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: "رقم الهاتف",
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                  ),
                  MainButton(
                    onPressed: () {},
                    width: 130.w,
                    child: CustomText(
                      "ارسال",
                      fontSize: 14.sp,
                      color: AppColors.lightColor,
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
