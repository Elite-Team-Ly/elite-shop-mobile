import 'package:elite_team_training_app/controllers/sign_in_controller.dart/sign_in_cubit.dart';
import 'package:elite_team_training_app/controllers/sign_in_controller.dart/sign_in_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/views/widgets/app/pattern_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/validators.dart';
import '../../widgets/widgets.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SignInCubit.get(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.h),
        child: CustomAppBarV1(
          title: 'تسجيل الدخول كمشتري',
          onBack: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: MainButton(
          onPressed: () {
            if (cubit.signInFormKey.currentState!.validate()) {
              cubit.login();
            }
          },
          width: double.infinity,
          height: 45.h,
          child: Text("تسجيل الدخول", style: TextStyle(fontSize: 14.sp)),
        ),
      ),
      body: PatternBackground(
        child: BlocConsumer<SignInCubit, SignInStates>(
          listener: (context, state) {
            if (state is SignInLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const LoadingIndicator(),
              );
            }
            if (state is SignInSuccessState) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.buyerHome,
                (route) => false,
              );
            }

            if (state is SignInErrorState) {
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

            if (state is UserNotFoundState) {
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
                  key: cubit.signInFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageWidget(
                        imagePath: AppAssets.customerLogin,
                        width: 300.w,
                        height: 300.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CustomText(
                          'سجّل دخولك وابدأ تجربة تسوّق لا مثيل لها',
                          color: AppColors.darkA30,
                          fontSize: 22.sp,
                        ),
                      ),
                      MultiContentBoxWidget(
                        width: double.infinity,
                        children: [
                          CustomTextField(
                            title: 'رقم الهاتف',
                            hintText: "الرجاء ادخال رقم هاتفك",
                            isPhoneNumber: true,
                            keyboardType: TextInputType.phone,
                            controller: cubit.phoneController,
                            validator: Validators.phone,
                          ),
                          CustomTextField(
                            title: 'كلمة المرور',
                            hintText: "الرجاء ادخال كلمة المرور",
                            keyboardType: TextInputType.visiblePassword,
                            controller: cubit.passController,
                            obscureText: cubit.isPassword,
                            icon: cubit.suffixIcon,
                            showIcon: true,
                            iconOnPressed: cubit.changePassVisibilty,
                            validator: Validators.password,
                          ),

                          RowWithAction(
                            alignment: MainAxisAlignment.start,
                            onActionTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.resetPassword,
                              );
                            },
                            normalWidget: CustomText(
                              "هل نسيت كلمة المرور ؟",
                              fontSize: 18.sp,
                              color: AppColors.darkA30,
                            ),
                            actionWidget: CustomText(
                              "إعادة تعيين كلمة مرور",
                              fontSize: 18.sp,
                              color: AppColors.primaryColor,
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
