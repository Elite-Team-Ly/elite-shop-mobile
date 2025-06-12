import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
import 'package:elite_team_training_app/controllers/otp_controller/otp_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OtpCubit.get(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "إعادة تعيين كلمة المرور",
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is SendingOtpLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingIndicator(),
            );
          }

          if (state is SendingOtpSuccessState) {
            // if (Navigator.canPop(context)) {
            //   Navigator.pop(context);
            // }
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
          return SafeArea(
            child: Form(
              key: cubit.phoneFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 36.w,
                      vertical: 100.h,
                    ),
                    child: MultiContentBoxWidget(
                      width: 300.w,
                      children: [
                        CustomText(
                          "الرجاء إدخال رقم الهاتف",
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: "رقم الهاتف",
                          isPhoneNumber: true,
                          controller: cubit.phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال رقم الهاتف';
                            }
                            if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                              return 'الرجاء إدخال رقم هاتف صحيح';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        MainButton(
                          onPressed: () {
                            if (cubit.phoneFormKey.currentState!.validate()) {
                              cubit.sendOtp();
                            }
                          },
                          width: 130.w,
                          height: 33.h,
                          child: CustomText(
                            "إرسال",
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
        },
      ),
    );
  }
}
