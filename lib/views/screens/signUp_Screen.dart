import 'package:elite_team_training_app/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedRole = 'مشتري';

    return Scaffold(
      appBar: CustomAppBar(
        title: 'الأشتراك',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              MultiContentBoxWidget(
                width: 300,
                children: [
                  CustomTextField(hintText: 'الأسم بالكامل'),
                  CustomTextField(
                    hintText: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TwoOptionSelector(
                          firstOption: 'مشتري',
                          secondOption: 'بائع',
                          selectedOption: selectedRole,
                          onChanged: (_) {},
                        ),
                      ),
                      Text("تسجيل كـــ", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ScrollDatePickerField(
                          onDateChanged: (DateTime value) {},
                        ),
                      ),
                      Text("العمر", style: TextStyle(fontSize: 14)),
                    ],
                  ),

                  CustomTextField(
                    hintText: 'كلمة المرور',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  CustomTextField(
                    hintText: 'تأكيد كلمة المرور',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  CustomTextField(
                    hintText: 'المنطقة',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  CustomTextField(hintText: 'العنوان'),
                ],
              ),
              const SizedBox(height: 20),
              MainButton(
                width: 130,
                onPressed: () {},
                child: const Text("أشتراك"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
