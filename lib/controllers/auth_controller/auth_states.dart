import 'package:elite_team_training_app/models/auth/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthAuthenticatedState extends AuthStates {
  final User user;

  AuthAuthenticatedState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticatedState extends AuthStates {}

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
