import 'package:elite_team_training_app/controllers/sign_up_controller/sign_up_states.dart';
import 'package:elite_team_training_app/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  ValueNotifier<String> roleNotifier = ValueNotifier('مشتري');
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  String? userId;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //create user doc in firestore
  Future<User> createUser() async {
    return User(
      fullName: fullNameController.text,
      phoneNumber: phoneController.text,
      role: roleController.text,
      birthDate: DateTime.parse(birthDateController.text),
      city: cityController.text,
      address: addressController.text,
    );
  }

  //control pass visibility
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignupChangePassVisibiltyState());
  }
}
