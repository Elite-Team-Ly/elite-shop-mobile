import 'package:elite_team_training_app/controllers/sign_in_controller.dart/sign_in_states.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  AuthService authService;

  SignInCubit(this.authService) : super(SignInInitialState());

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
          emit(SignInSuccessState(user));
        },
      );
    });
    // if (phoneController.text == "12345678" &&
    //     passController.text == "12345678gg") {
      // emit(
      //   SignInSuccessState(
      //     User(
      //       fullName: phoneController.text,
      //       phoneNumber: passController.text,
      //       city: 'null',
      //       role: 'null',
      //       birthDate: DateTime.now(),
      //       address: 'null',
      //     ),
      //   ),
      // );
    // } else if (phoneController.text != "12345678") {
    //   emit(UserNotFoundState("لم يتم العثور على المستخدم"));
    // } else {
    //   emit(SignInErrorState("كلمة المرور غير صحيحة"));
    // }
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
