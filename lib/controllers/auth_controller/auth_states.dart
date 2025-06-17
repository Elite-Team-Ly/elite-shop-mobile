import 'package:equatable/equatable.dart';

import '../../models/auth/sign_in_model.dart';

abstract class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final User user;

  AuthSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailState extends AuthStates {}

class AuthGetUserState extends AuthStates {
  final User user;
  AuthGetUserState(this.user);
}

class AuthErrorState extends AuthStates {
  final String errorMessage;

  AuthErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
