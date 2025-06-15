import 'package:dio/dio.dart';

class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});


  factory Failure.fromResponse(Response response) {
    return Failure(
      message: response.data?['message'] ?? 'Unknown error',
      code: response.statusCode,
    );
  }
  Failure _handleFailure(Response response) => Failure(
    message: response.data?['message'] ?? 'Unknown error',
    code: response.statusCode,
  );
}
