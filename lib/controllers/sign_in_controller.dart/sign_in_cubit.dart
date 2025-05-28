import 'package:elite_team_training_app/controllers/sign_in_controller.dart/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/auth/user_model.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

//methods
  void login() async {
    emit(SignInLoadingState());
    // simulate login flow
    await Future.delayed(const Duration(seconds: 2));

    if (phoneController.text == "12345678" &&
        passController.text == "12345678gg") {
      emit(
        SignInSuccessState(
          User(
            fullName: phoneController.text,
            phoneNumber: passController.text,
            city: 'null',
            role: 'null',
            birthDate: DateTime.now(),
            address: 'null',
          ),
        ),
      );
    } else if (phoneController.text != "12345678") {
      emit(UserNotFoundState());
    } else {
      emit(SignInErrorState("كلمة المرور غير صحيحة"));
    }
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