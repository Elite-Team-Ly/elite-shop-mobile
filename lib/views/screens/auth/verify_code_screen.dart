import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
import 'package:elite_team_training_app/controllers/otp_controller/otp_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
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
        appBar: CustomAppBar(
          title: 'التحقق و المصادقة',
          subtitle:
              purpose == OtpPurpose.account_creation
                  ? 'أنشئ حسابك بسهولة وابدأ في الاستفادة من خدماتنا'
                  : "إعادة تعيين كلمة المرور",
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<OtpCubit, OtpStates>(
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
                            RouteNames.home,
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
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 100.0.h,
                  horizontal: 33.w,
                ),
                child: Form(
                  key: otpCubit.otpFormKey,
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
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => otpCubit.sendOtp(),
                                  child: Text(
                                    "إعادة إرسال الكود",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.primaryColor,
                                    ),
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
                              onPressed: () {
                                if (otpCubit.otpFormKey.currentState!
                                    .validate()) {
                                  otpCubit.phoneNumber = phoneNumber;
                                  otpCubit.verifyOtp(purpose);
                                }
                              },
                              width: 130.w,
                              child: Text(
                                "تحقق",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
