import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/errors/failure.dart';
import 'package:elite_team_training_app/core/services/app_services.dart';
import 'package:elite_team_training_app/models/auth/forgetpassword.dart';
import 'package:elite_team_training_app/models/auth/otp/OtpModel.dart';
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/auth/sign_up_model.dart';

class AuthService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  AuthService(this.apiService);

  Future<Either<Failure, User>> signIn(SignInModel model) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.signIn}',
      model.toJson(),
    );
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      final signInResponse = SignInResponse.fromJson(response.data);
      final token = signInResponse.token;
      print('token from signin $token');
      await LocalStorageService.saveToken(token);
      final user = signInResponse.user;

      return Right(user);
    } else {

      return Left(_handleFailure(response));
    }
  }

  Future<Either<Failure, String>> signUp(SignUpModel model) async {
    final response = await apiService.postRequest('$baseurl${AppEndpoints.signUp}', model.toJson());
    if (response.statusCode == 201) {
      return Right(response.data['message']);
    } else {
      return Left(_handleFailure(response));

    }
  }

  Future<Either<Failure, String>> sendOtp(SendOtpModel model) async {
    final response = await apiService.postRequest('$baseurl${AppEndpoints.sendOtp}',
     model.toJson());

    if (response.statusCode == 200) {
      return Right(response.data['message']);
    } else {
      return Left(_handleFailure(response));
    }
  }

  Future<Either<Failure, String>> verifyOtp(VerifyOtpModel model) async {
    final response = await apiService.postRequest('$baseurl${AppEndpoints.verifyOtp}', model.toJson());
    if (response.statusCode == 200) {
      return Right(response.data['message']);
    } else {
      return Left(_handleFailure(response));
    }
  }

  Future<Either<Failure, String>> resetPassword(ResetPasswordModel model) async {
    final response = await apiService.postRequest('$baseurl${AppEndpoints.resetPassword}', model.toJson());
    if (response.statusCode == 200) {
return Right(response.data['message']);
    } else {
      return Left(_handleFailure(response));
    }
  }


  Failure _handleFailure(Response response) => Failure(
    message: response.data?['message'] ?? 'Unknown error',
    code: response.statusCode,
  );

}
