
class SignInModel {
  final String phoneNumber;
  final String password;

  SignInModel({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'phone': phoneNumber,
    'password': password,
  };
}

class SignInResponse {
  final String status;
  final String message;
  final String token;
  final User user;

  SignInResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return SignInResponse(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      user: User.fromJson(data['user']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String phone;
  final List<String> roles;
  final bool approved;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.roles,
    required this.approved,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      roles: List<String>.from(json['roles']),
      approved: json['approved'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'roles': roles,
      'approved': approved,
    };
  }
}
enum Role { buyer, seller}