import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../config/constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppLink.server,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  String? _jwtToken;

  void setJwtToken(String token) {
    _jwtToken = token;
  }

  Map<String, String> _prepareHeaders(Map<String, String>? headers) {
    final finalHeaders = <String, String>{};

    if (headers != null) {
      finalHeaders.addAll(headers);
    }

    if (_jwtToken != null && !finalHeaders.containsKey('Authorization')) {
      finalHeaders['Authorization'] = 'Bearer $_jwtToken';
    }

    return finalHeaders;
  }

  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final finalHeaders = _prepareHeaders(headers);
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: finalHeaders),
      );
    } catch (e) {
      return _handleError(endpoint, e);
    }
  }

  Future<Response> postRequest(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    debugPrint('data from service post $data');
    try {

      final finalHeaders = _prepareHeaders(headers);
      return await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: finalHeaders),
      );

    } catch (e) {
      return _handleError(endpoint, e);
    }
  }

  Future<Response> putRequest(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    try {
      final finalHeaders = _prepareHeaders(headers);
      return await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: finalHeaders),
      );
    } catch (e) {
      return _handleError(endpoint, e);
    }
  }

  Future<Response> deleteRequest(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final finalHeaders = _prepareHeaders(headers);
      return await _dio.delete(
        endpoint,
        options: Options(headers: finalHeaders),
      );
    } catch (e) {
      return _handleError(endpoint, e);
    }
  }

  Response _handleError(String endpoint, dynamic error) {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      statusCode: 500,
      data: {'error': error.toString()},
    );
  }
}
