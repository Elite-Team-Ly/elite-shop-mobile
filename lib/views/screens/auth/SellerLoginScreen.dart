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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "اعادة تعيين كلمة مرور",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary_color,
                          ),
                        ),
                        Text(
                          "هل نسيت كلمة المرور ؟",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  MainButton(
                    onPressed: () {},
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
