import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 100.0,horizontal: 33),
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
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(hintText: "5346346",keyboardType: TextInputType.number,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("أعادة الارسال الكود",style: TextStyle(fontSize: 18,color: AppColors.primaryColor),),
                        Text("ألم تتلقى كود التأكيد ؟",style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButton(
                      onPressed: () {
                      },
                      width: 130,
                      height: 40,
                      child: Text("تحقق", style: TextStyle(fontSize: 12)),
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
