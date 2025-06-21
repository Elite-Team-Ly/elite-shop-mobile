import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
import 'package:elite_team_training_app/controllers/otp_controller/otp_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/core/utils/validators.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/app/pattern_background.dart';
import '../../widgets/widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OtpCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.h),
        child: CustomAppBarV1(
          title: "إعادة تعيين كلمة المرور",
          onBack: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: MainButton(
          onPressed: () {
            if (cubit.phoneFormKey.currentState!.validate()) {
              cubit.sendOtp();
            }
          },
          width: double.infinity,
          height: 45.h,
          child: CustomText(
            "إرسال",
            fontSize: 14.sp,
            color: AppColors.lightColor,
          ),
        ),
      ),

      body: PatternBackground(
        child: SafeArea(
          child: BlocConsumer<OtpCubit, OtpStates>(
            listener: (context, state) {
              if (state is SendingOtpLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const LoadingIndicator(),
                );
              }

              if (state is SendingOtpSuccessState) {
                Navigator.pushNamed(
                  context,
                  RouteNames.verifyCode,
                  arguments: {
                    'otpCubit': cubit,
                    'phoneNumber': cubit.phoneController.text,
                    'purpose': OtpPurpose.password_reset,
                  },
                );
              }

              if (state is SendingOtpErrorState) {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('حدث خطأ ما!'),
                      content: Text(state.message),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('حسناً'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Form(
                          key: cubit.phoneFormKey,
                          child: Center(
                            child: MultiContentBoxWidget(
                              width: double.infinity,
                              children: [
                                CustomText(
                                  "أدخل رقم هاتفك لاستلام رمز التحقق عبر الرسائل النصية (SMS)",
                                  fontSize: 22.sp,
                                  color: AppColors.darkA30,
                                  textAlign: TextAlign.center,
                                ),
                                CustomTextField(
                                  showIcon: true,
                                  icon: Icons.phone,
                                  hintText: "09xxxxxxxx",
                                  isPhoneNumber: true,
                                  controller: cubit.phoneController,
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  validator: Validators.phone,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
