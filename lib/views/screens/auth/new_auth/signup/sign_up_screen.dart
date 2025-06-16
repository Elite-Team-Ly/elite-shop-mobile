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
import '../../../../widgets/widgets.dart';
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
          // PartThreeWidget(formKey: cubit.formKeys[2]),
        ];

        final currentPartWidget = partWidgets[cubit.currentPartIndex];
        final isLastStep = cubit.currentPartIndex == partWidgets.length - 1;

        final previousButton =
            cubit.currentPartIndex > 0
                ? MainButton(
                  onPressed: cubit.goToPreviousPart,
                  child: CustomText('السابق'),
                )
                : const SizedBox(width: 100);

        final nextOrSubmitButton = MainButton(
          onPressed: () {
            final formState =
                cubit.formKeys[cubit.currentPartIndex].currentState;
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
          },
          child: CustomText(isLastStep ? 'أتمام الاشتراك' : 'التالي'),
        );

        return Scaffold(
          appBar: CustomAppBar(
            title: 'انشاء حساب جديد',
            onBack: () {
              cubit.currentPartIndex > 0
                  ? cubit.goToPreviousPart()
                  : Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 12.w),
              child: Column(
                children: [
                  currentPartWidget,
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [previousButton, nextOrSubmitButton],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
