import 'package:elite_team_training_app/controllers/reset_password_controller/reset_password_states.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  AuthService authService;

  ResetPasswordCubit(this.authService) : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  Future<void> resetPassword(String phoneNumber) async {
    emit(ResetPasswordLoadingState());

    authService
        .resetPassword(
          ResetPasswordModel(
            phoneNumber: phoneNumber,
            newPassword: newPasswordController.text,
          ),
        )
        .then((result) {
          result.fold(
            (failure) {
              emit(ResetPasswordErrorState(failure.message));
            },
            (successMessage) {
              emit(ResetPasswordSuccessState());
            },
          );
        });
  }

    //control pass visibility
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ResetPassChangePassVisibiltyState());
  }
}
