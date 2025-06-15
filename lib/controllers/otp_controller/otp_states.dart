abstract class OtpStates {}

class OtpInitialState extends OtpStates {}


class SendingOtpLoadingState extends OtpStates {}

class SendingOtpSuccessState extends OtpStates {}

class SendingOtpErrorState extends OtpStates {
  final String message;
  SendingOtpErrorState(this.message);
}

class VerifyOtpLoadingState extends OtpStates {}

class VerifyOtpSuccessState extends OtpStates {}

class VerifyOtpErrorState extends OtpStates {
  final String message;
  VerifyOtpErrorState(this.message);
}
