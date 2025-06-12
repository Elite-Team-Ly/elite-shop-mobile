abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
  ResetPasswordSuccessState();
}

class ResetPasswordErrorState implements ResetPasswordStates {
  final String message;
  ResetPasswordErrorState(this.message);
}

class ResetPassChangePassVisibiltyState extends ResetPasswordStates {
  ResetPassChangePassVisibiltyState();
}
