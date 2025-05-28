import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'التحقق و المصادقة',
        subtitle: 'أنشئ حسابك بسهولة وابدأ في الاستفادة من خدماتنا',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0.h, horizontal: 33.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              MultiContentBoxWidget(
                width: double.infinity,
                children: [
                  Text(
                    "تم ارسال كود التأكيد الى رقم هاتفك  الرجاء التأكيد",
                    style: TextStyle(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: CustomTextField(
                      textAlign: TextAlign.center,
                      hintText: "5346346",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "أعادة الارسال الكود",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          "ألم تتلقى كود التأكيد ؟",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButton(
                      onPressed: () {},
                      width: 130.w,
                      child: Text("تحقق", style: TextStyle(fontSize: 12.sp)),
                    ),
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
