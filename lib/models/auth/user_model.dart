class User {
  String fullName;
  String phoneNumber;
  String role;
  DateTime birthDate;
  String city;
  String address;

  User({
    required this.fullName,
    required this.phoneNumber,
    required this.role,
    required this.birthDate,
    required this.city,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['data']['user']['name'],
      phoneNumber: json['data']['user']['phone'],
      role: json['role'],
      birthDate: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['birthDate']),
      ),
      city: json['city'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'role': role,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'city': city,
      'address': address,
    };
  }
}
