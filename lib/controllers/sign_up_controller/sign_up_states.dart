abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  // final User userModel;
  final String message;
  SignupSuccessState(this.message);
}

class OtpSentState extends SignupStates {}

class OtpVerifiedState extends SignupStates {}

class SignupChangePassVisibiltyState extends SignupStates {}

class SignupChangePartState extends SignupStates {}

class SignupAgreeTermsChangedState extends SignupStates {}

class CitiesLoadedState extends SignupStates {}

class CityChangedState extends SignupStates {}

class CitiesLoadingState extends SignupStates {}

class DistrictChangedState extends SignupStates {}

class DistrictsLoadedState extends SignupStates {}

class DistrictsLoadingState extends SignupStates {}

class EmailVerifiedState extends SignupStates {}



class SignupErrorState implements SignupStates {
  final String message;

  SignupErrorState(this.message);
}
