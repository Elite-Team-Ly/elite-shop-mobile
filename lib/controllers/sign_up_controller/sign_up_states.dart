import 'package:elite_team_training_app/models/auth/user_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  final User userModel;
  SignupSuccessState(this.userModel);
}

class OtpSentState extends SignupStates {}

class OtpVerifiedState extends SignupStates {}

class SignupChangePassVisibiltyState extends SignupStates {}

class EmailVerifiedState extends SignupStates {}

class SignupErrorState implements SignupStates {
  final String message;
  SignupErrorState(this.message);
}
