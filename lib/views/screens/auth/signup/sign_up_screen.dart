import 'package:elite_team_training_app/views/widgets/app/pattern_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../../controllers/otp_controller/otp_cubit.dart';
import '../../../../../controllers/sign_up_controller/sign_up_cubit.dart';
import '../../../../../controllers/sign_up_controller/sign_up_states.dart';
import '../../../../../core/config/routes.dart';
import '../../../../../models/auth/otp/otp_model.dart';
import '../../../widgets/widgets.dart';
import 'sign_up_steps.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        final cubit = SignupCubit.get(context);
        if (state is SignupLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const LoadingIndicator(),
          );
        }
        if (state is SignupErrorState) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.message),
          );
        }
        if (state is SignupSuccessState) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Navigator.pushNamed(
            context,
            RouteNames.verifyCode,
            arguments: {
              'otpCubit': OtpCubit.get(context),
              'phoneNumber': cubit.phoneController.text,
              'purpose': OtpPurpose.account_creation,
            },
          );
        }
      },
      builder: (context, state) {
        final cubit = SignupCubit.get(context);
        final partWidgets = [
          PartOneWidget(formKey: cubit.formKeys[0]),
          PartTwoWidget(formKey: cubit.formKeys[1]),
        ];

        final safeIndex = cubit.currentPartIndex.clamp(0, partWidgets.length - 1);
        final isLastStep = safeIndex == partWidgets.length - 1;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(140.h),
            child: CustomAppBar(
              title: 'انشاء حساب جديد',
              onBack: () => cubit.currentPartIndex > 0
                  ? cubit.goToPreviousPart()
                  : Navigator.pop(context),
            ),
          ),
          body: PatternBackground(
            child: Column(
              children: [
                Expanded(
                  child: partWidgets[safeIndex],
                ),
                _buildBottomButton(cubit, context, isLastStep),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomButton(SignupCubit cubit, BuildContext context, bool isLastStep) {
    final isFirstStep = cubit.currentPartIndex == 0;

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          if (!isFirstStep)
            Expanded(
              child: MainButton(
                height: 45.h,
                onPressed: cubit.goToPreviousPart,
                child: const CustomText('السابق'),
              ),
            ),
          if (!isFirstStep) SizedBox(width: 8.w),
          Expanded(
            flex: isFirstStep ? 1 : 2,
            child: MainButton(
              height: 45.h,
              onPressed: () => _handleMainButtonPress(cubit, context, isLastStep),
              child: CustomText(isLastStep ? 'أتمام الاشتراك' : 'التالي'),
            ),
          ),
        ],
      ),
    );
  }

  void _handleMainButtonPress(SignupCubit cubit, BuildContext context, bool isLastStep) {
    final safeIndex = cubit.currentPartIndex.clamp(0, cubit.formKeys.length - 1);
    final formState = cubit.formKeys[safeIndex].currentState;

    if (formState != null && formState.validate()) {
      if (!cubit.agreeTerms) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "يجب الموافقة على شروط الاستخدام للمتابعة",
          ),
        );
        return;
      }
      isLastStep ? cubit.signup() : cubit.goToNextPart();
    }
  }
}