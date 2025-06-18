import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
import 'package:elite_team_training_app/controllers/otp_controller/otp_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:elite_team_training_app/views/widgets/app/pattern_background.dart';
import 'package:elite_team_training_app/views/widgets/shared/success_dialog.dart';
import 'package:elite_team_training_app/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeScreen extends StatelessWidget {
  final OtpCubit otpCubit;
  final String phoneNumber;
  final OtpPurpose purpose;

  const VerifyCodeScreen({
    super.key,
    required this.otpCubit,
    required this.phoneNumber,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    // final OtpCubit cubit = context.watch<OtpCubit>();

    return BlocProvider.value(
      value: otpCubit,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.h),
          child: CustomAppBar(
            title: 'تسجيل الدخول كبائع',
            onBack: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: MainButton(
            onPressed: () {
              if (otpCubit.otpFormKey.currentState!.validate()) {
                otpCubit.phoneNumber = phoneNumber;
                otpCubit.verifyOtp(purpose);
              }
            },
            width: double.infinity,
            height: 45.h,
            child: Text("تحقق", style: TextStyle(fontSize: 14.sp)),
          ),
        ),
        body: PatternBackground(
          child: BlocConsumer<OtpCubit, OtpStates>(
            listener: (context, state) {
              if (state is VerifyOtpLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const LoadingIndicator(),
                );
              }

              if (state is VerifyOtpSuccessState) {
                // if (Navigator.canPop(context)) {
                //   Navigator.pop(context);
                // }
                showDialog(
                  context: context,
                  barrierDismissible:
                      false, // Prevents closing by tapping outside
                  builder: (context) {
                    if (purpose == OtpPurpose.account_creation) {
                      return SuccessDialog(
                        message:
                            "مرحبًا بك! لقد تم تفعيل اشتراكك في التطبيق بنجاح. استمتع بتجربتك",
                        onOkPressed:
                            () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteNames.buyerHome,
                              (route) => false,
                            ),
                      );
                    } else {
                      return SuccessDialog(
                        message:
                            "تم التحقق بنجاح! يمكنك الآن إعادة تعيين كلمة المرور الخاصة بك",
                        onOkPressed:
                            () => Navigator.pushNamed(
                              context,
                              RouteNames.newPassword,
                              arguments: {
                                'phoneNumber': phoneNumber,
                                'purpose': purpose,
                              },
                            ),
                      );
                    }
                  },
                );
              }

              if (state is VerifyOtpErrorState) {
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
                  key: otpCubit.otpFormKey,
                  child: Center(
                    child: MultiContentBoxWidget(
                      width: double.infinity,
                      children: [
                        CustomText(
                          "تم ارسال كود التأكيد الى  $phoneNumber   الرجاء التأكيد",
                          fontSize: 22.sp,
                          color: AppColors.darkA30,
                          textAlign: TextAlign.center,
                        ),
                        CustomTextField(
                          showIcon: true,
                          icon: Icons.sms,
                          textAlign: TextAlign.center,
                          controller: otpCubit.otpCodeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال كود التأكيد';
                            }
                            return null;
                          },
                          hintText: "5346346",
                          keyboardType: TextInputType.number,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0.w),
                          child: RowWithAction(
                            normalWidget: CustomText(
                              "ألم تتلقى كود التأكيد ؟",
                              color: AppColors.darkA30,
                              fontSize: 18.sp,
                            ),
                            actionWidget: CustomText(
                              "أعادة الارسال الكود",
                              color: AppColors.primaryColor,
                              fontSize: 18.sp,
                            ),
                            onActionTap: () {
                              // otpCubit.sendOtp();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
