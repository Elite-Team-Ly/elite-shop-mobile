import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/core/services/app_services.dart';
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';

import '../../models/auth/sign_up_model.dart';
import '../../models/auth/user_model.dart';

class AuthService{
  final ApiService apiService;
  AuthService(this.apiService);

  // Future<Either<User?, String>> login(SignInModel model) async {
  // }

  Future<Either<String, User?>> login(SignInModel model) async {
    final response = await apiService.postRequest('/login', {
      'phoneNumber': model.phoneNumber,
      'password': model.password,
    });

    if (response.statusCode == 200 && response.data['token'] != null) {
      final token = response.data['token'];
      apiService.setJwtToken(token);
      final user = User.fromJson(response.data);
      return Right(user);
    } else {
      final errorMessage = response.data['error'] ?? 'Unknown error';
      return Left(errorMessage);
    }
  }


  Future<String>signUp(SignUpModel model) async{
    final response = await apiService.postRequest('/signUp', {
      'fullName':model.fullName,
      'phoneNumber':model.phoneNumber,
      'role':model.role,
      'birthDate':model.birthDate,
      'city':model.city,
      'address':model.address
    });
if(response.statusCode==200){
  return response.data['message'];
}else{
  return response.data['error'];
}
}
}