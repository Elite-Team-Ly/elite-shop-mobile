class SendOtpModel {
  final String phoneNumber;
  final OtpAction action;

  SendOtpModel({required this.phoneNumber, required this.action});

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'action': action.name};
  }
}

enum OtpAction{
  signup,
  forgetPassword
}