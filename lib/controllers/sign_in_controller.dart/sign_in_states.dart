
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}


class SignInSuccessState extends SignInStates {
  final User user;
  SignInSuccessState(this.user);
}

class UserNotFoundState extends SignInStates {
  final String message;
  UserNotFoundState(this.message);
}

class SignInErrorState implements SignInStates {
  final String message;
  SignInErrorState(this.message);
}

class LoginChangePassVisibiltyState extends SignInStates {}