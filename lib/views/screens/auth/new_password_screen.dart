//this will appear after verifying the otp is true.
//need 2 text fields, and it will use the reset pass cubit
//++ need to complete the sign up verify otp
//++ tell them that i just worked for the customer login, does the seller need?

import 'package:elite_team_training_app/controllers/reset_password_controller/reset_password_cubit.dart';
import 'package:elite_team_training_app/controllers/reset_password_controller/reset_password_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:elite_team_training_app/views/widgets/shared/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/validators.dart';
import '../../widgets/widgets.dart';

class NewPasswordScreen extends StatelessWidget {
  final String phoneNumber;
  final OtpPurpose purpose;
  const NewPasswordScreen({
    super.key,
    required this.phoneNumber,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = ResetPasswordCubit.get(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'إعادة تعيين كلمة المرور',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const LoadingIndicator(),
            );
          }

          if (state is ResetPasswordSuccessState) {
            showDialog(
              context: context,
              barrierDismissible: false, // Prevents closing by tapping outside
              builder: (context) {
                return SuccessDialog(
                  message: "مرحباً بك! تم حفظ كلمة المرور الجديدة",
                  onOkPressed:
                      () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.home,
                        (route) => false,
                      ),
                );
              },
            );
          }

          if (state is ResetPasswordErrorState) {
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
            child: SingleChildScrollView(
              child: Form(
                key: cubit.resetPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageWidget(
                      imagePath: AppAssets.customerLogin,
                      width: 280.w,
                      height: 280.h,
                    ),

                    MultiContentBoxWidget(
                      width: 300.w,
                      children: [
                        CustomTextField(
                          hintText: "كلمة المرور",
                          keyboardType: TextInputType.visiblePassword,
                          controller: cubit.newPasswordController,
                          obscureText: cubit.isPassword,
                          icon: cubit.suffixIcon,
                          showIcon: true,
                          iconOnPressed: cubit.changePassVisibilty,
                          validator: Validators.password,
                        ),
                        CustomTextField(
                          hintText: "تأكيد كلمة المرور",
                          keyboardType: TextInputType.visiblePassword,
                          controller: cubit.confirmNewPasswordController,
                          obscureText: cubit.isPassword,
                          icon: cubit.suffixIcon,
                          showIcon: true,
                          iconOnPressed: cubit.changePassVisibilty,
                          validator:
                              (value) => Validators.confirmPassword(
                                value,
                                cubit.newPasswordController.text,
                              ),
                        ),

                        SizedBox(height: 20.h),
                        MainButton(
                          onPressed: () {
                            if (cubit.resetPasswordFormKey.currentState!
                                .validate()) {
                              cubit.resetPassword(phoneNumber);
                            }
                          },
                          width: 130.w,
                          height: 33.h,
                          child: Text("حفظ", style: TextStyle(fontSize: 14.sp)),
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
    );
  }
}
