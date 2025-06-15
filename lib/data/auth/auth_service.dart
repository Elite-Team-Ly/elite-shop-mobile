// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/errors/failure.dart';
import 'package:elite_team_training_app/core/services/app_services.dart';
import 'package:elite_team_training_app/models/auth/forgetpassword.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:elite_team_training_app/models/auth/sign_in_model.dart';
import '../../core/helper/network_helper.dart';
import '../../models/auth/sign_up_model.dart';

class AuthService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  AuthService(this.apiService);

  Future<Either<Failure, String>> signUp(SignUpModel model) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.signUp}',
      model.toJson(),
    );
    if (NetworkHelper.isSuccess(response)) {
      return Right(response.data['message']);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, SignInResponse>> signIn(SignInModel model) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.signIn}',
      model.toJson(),
    );
    if (NetworkHelper.isSuccess(response) &&
        response.data['status'] == 'success') {
      final signInResponse = SignInResponse.fromJson(response.data);
      return Right(signInResponse);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, String>> sendVerifyCode(SendOtpModel model) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.sendOtp}',
      model.toJson(),
    );

    if (NetworkHelper.isSuccess(response)) {
      return Right(response.data['message']);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, String>> verifyCode(VerifyOtpModel model) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.verifyOtp}',
      model.toJson(),
    );
    if (NetworkHelper.isSuccess(response)) {
      return Right(response.data['message']);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, String>> resetPassword(
    ResetPasswordModel model,
  ) async {
    final response = await apiService.postRequest(
      '$baseurl${AppEndpoints.resetPassword}',
      model.toJson(),
    );
    if (NetworkHelper.isSuccess(response)) {
      return Right(response.data['message']);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
}
