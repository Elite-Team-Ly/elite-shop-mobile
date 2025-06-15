class ResetPasswordModel {
  final String phoneNumber;
  final String newPassword;

  ResetPasswordModel({required this.phoneNumber, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {
      "phone":phoneNumber,
      "newPassword":newPassword
    };
  }
}