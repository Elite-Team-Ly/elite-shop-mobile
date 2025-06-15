import 'package:dio/dio.dart';

class NetworkHelper {
  static bool isSuccess(Response response) {
    return response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300;
  }
}
