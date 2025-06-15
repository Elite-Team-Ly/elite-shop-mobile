import 'package:elite_team_training_app/models/auth/sign_in_model.dart';

class SignUpModel {
  final String name;
  final String phone;
  final String password;
  final Role role;
  final String gender;
  final String birthDate;
  Addresses address;

  SignUpModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.role,
    required this.gender,
    required this.birthDate,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'gender': gender,
      //'role': role.name,
      'dateOfBirth': birthDate.toString(),
      'addresses': address,
    };
  }
}

class Addresses {
  final String city;
  final String street;
  final double latitude;
  final double longitude;

  Addresses({
    required this.city,
    required this.street,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "city": city,
      "street": street,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
