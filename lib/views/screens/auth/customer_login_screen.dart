import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل الدخول كمشتري',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageWidget(
                imagePath: AppAssets.customerLogin,
                width: 280,
                height: 280,
              ),

              MultiContentBoxWidget(
                width: 300,
                children: [
                  CustomTextField(
                    hintText: "رقم الهاتف",
                    keyboardType: TextInputType.phone,
                  ),
                  CustomTextField(
                    hintText: "كلمة المرور",
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  RowWithAction(
                    onActionTap: () {
                      // هنا ممكن تضيف وظيفة إعادة تعيين كلمة المرور
                    },
                    normalWidget: CustomText(
                      "هل نسيت كلمة المرور ؟",
                      fontSize: 16,
                    ),
                    actionWidget: CustomText(
                      "إعادة تعيين كلمة مرور",
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  MainButton(
                    onPressed: () {
                      // وظيفة تسجيل الدخول
                    },
                    width: 130,
                    height: 45,
                    child: CustomText("تسجيل الدخول", fontSize: 14),
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
