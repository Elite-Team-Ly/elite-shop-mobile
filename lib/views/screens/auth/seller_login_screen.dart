import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class SellerLoginScreen extends StatelessWidget {
  const SellerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل الدخول كبائع',
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
                imagePath: AppAssets.sellerLogin,
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
                      // أضف هنا منطق إعادة تعيين كلمة المرور عند الحاجة
                    },
                    normalWidget: CustomText(
                      "هل نسيت كلمة المرور ؟",
                      fontSize: 16,
                    ),
                    actionWidget: CustomText(
                      "اعادة تعيين كلمة مرور",
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  MainButton(
                    onPressed: () {
                      // أضف هنا منطق تسجيل الدخول
                    },
                    width: 130,
                    height: 45,
                    child: const Text(
                      "تسجيل دخول",
                      style: TextStyle(fontSize: 14),
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
