class SignUpModel {
  final String fullName;
  final String phoneNumber;
  final String password;
  final Role role;
  final DateTime birthDate;
  final String city;
  final String address;

  SignUpModel({
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.role,
    required this.birthDate,
    required this.city,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'password': password,
      'role': role,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'city': city,
      'address': address,
    };
  }
}
enum Role{
  customer,
  seller
}

