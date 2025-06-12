class SendOtpModel {
  final String phoneNumber;
  final OtpPurpose purpose;

  SendOtpModel({required this.phoneNumber, required this.purpose});

  Map<String, dynamic> toJson() {
    return {'phone': phoneNumber, 'purpose': purpose.name};
  }
}

class VerifyOtpModel {
  final String phoneNumber;
  final String code;
  final OtpPurpose purpose;

  VerifyOtpModel({
    required this.phoneNumber,
    required this.code,
    required this.purpose,
  });

  Map<String, dynamic> toJson() {
    return {'phone': phoneNumber, 'code': code, 'purpose': purpose.name};
  }
}

enum OtpPurpose { accountCreation, passwordReset }
