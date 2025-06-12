import 'package:elite_team_training_app/controllers/otp_controller/otp_states.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/otp/OtpModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpStates> {
  AuthService authService;

  OtpCubit(this.authService) : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();

  String phoneNumber = '';
  Future<void> sendOtp() async {
    emit(SendingOtpLoadingState());
    print(phoneNumber);
    phoneNumber = phoneController.text;
    print(phoneNumber);

    //send otp to the phone number
    authService
        .sendOtp(
          SendOtpModel(
            phoneNumber: phoneNumber,
            purpose: OtpPurpose.password_reset,
          ),
        )
        .then((result) {
          result.fold(
            (failure) {
              emit(SendingOtpErrorState(failure.message));
            },
            (successMessage) {
              emit(SendingOtpSuccessState());
              // Navigate to the OTP verification screen
            },
          );
        });
  }

  Future<void> verifyOtp(OtpPurpose otpPurpose) async {
    emit(VerifyOtpLoadingState());

    authService
        .verifyOtp(
          VerifyOtpModel(
            phoneNumber: phoneNumber,
            code: otpCodeController.text,
            purpose: otpPurpose,
          ),
        )
        .then((result) {
          result.fold(
            (failure) {
              emit(VerifyOtpErrorState(failure.message));
            },
            (successMessage) {
              emit(VerifyOtpSuccessState());
              // Navigate to the reset password screen
            },
          );
        });
  }
}
