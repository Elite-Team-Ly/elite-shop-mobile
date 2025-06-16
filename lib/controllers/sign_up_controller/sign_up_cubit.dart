import 'package:elite_team_training_app/controllers/sign_up_controller/sign_up_states.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this.authService) : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  int currentPartIndex = 0;
  AuthService authService;
  ValueNotifier<String> roleNotifier = ValueNotifier('مشتري');
  ValueNotifier<String> genderNotifier = ValueNotifier('male');
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  bool agreeTerms = false;

  String? userId;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];


  Future<SignUpModel> signup() async {
    emit(SignupLoadingState());

    // Role selectedRole = Role.buyer; // Default role
    // if (roleNotifier.value == 'مشتري') {
    //   selectedRole = Role.buyer;
    // } else if (roleNotifier.value == 'بائع') {
    //   selectedRole = Role.seller;
    // }

    final Addresses address = Addresses(
      city: cityController.text,
      district: districtController.text,
      latitude: 0.0,
      longitude: 0.0,
    );
    final SignUpModel signUpModel = SignUpModel(
      name: fullNameController.text,
      phone: phoneController.text,
      password: passController.text,
      // role: selectedRole,
      birthDate: birthDateController.text,
      address: address,
      gender: genderNotifier.value,
    );

    authService.signUp(signUpModel).then((result) {
      result.fold(
            (failure) {
          emit(SignupErrorState(failure.message));
        },
            (user) {
          //this user is a String because the API returns success message only not the user object
          emit(SignupSuccessState(user));
        },
      );
    });
    return signUpModel;
  }

  //control pass visibility
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignupChangePassVisibiltyState());
  }

  // this update by hemo

  void goToNextPart() {
    if (currentPartIndex < 2) {
      currentPartIndex++;
      emit(SignupChangePartState());
    }
  }

  void goToPreviousPart() {
    if (currentPartIndex > 0) {
      currentPartIndex--;
      emit(SignupChangePartState());
    }
  }

  void toggleAgreeTerms(bool? value) {
    agreeTerms = value!;
    emit(SignupAgreeTermsChangedState());
  }

  void onCityChanged(String? id) {
    cityController.text = id ?? '';
    districtController.clear();
    emit(CityChangedState());
  }
  void ondDistrictChanged(String? id) {
    districtController.text = id ?? '';
    emit(DistrictChangedState());
  }
}
