class SignInModel {
   final String phoneNumber;
   final String password;

  SignInModel({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'password': password};
  }
}
