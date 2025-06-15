import 'package:elite_team_training_app/controllers/auth_controller/auth_cubit.dart';
import 'package:elite_team_training_app/controllers/sign_in_controller.dart/sign_in_states.dart';
import 'package:elite_team_training_app/core/services/local_storage_service.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  AuthService authService;
  AuthCubit authCubit;

  SignInCubit(this.authService, this.authCubit) : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  //methods
  Future login() async {
    emit(SignInLoadingState());
    final SignInModel signInModel = SignInModel(
      phoneNumber: phoneController.text,
      password: passController.text,
    );
    authService.signIn(signInModel).then((result) {
      result.fold(
        (failure) {
          emit(SignInErrorState(failure.message));
        },
        (user) {
          LocalStorageService.saveToken(user.token);
          LocalStorageService.saveUserData(user.user.toJson());
          authCubit.onSuccessfulSignIn(user.user, user.token);
          emit(SignInSuccessState(user));
        },
      );
    });
  }

  //show-hide password
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePassVisibiltyState());
  }
}
