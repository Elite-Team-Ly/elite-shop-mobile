import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/app_dialog.dart';
import 'api_exception.dart';
import 'network_exceptions.dart';

class ErrorHandler {
  static void handle({
    required BuildContext context,
    required dynamic error,
  }) {
    String errorMessage = 'حدث خطأ غير متوقع';

    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'انتهت مهلة الاتصال بالخادم';
      } else if (error.type == DioExceptionType.connectionError) {
        errorMessage = 'لا يوجد اتصال بالإنترنت';
      } else if (error.response != null) {
        errorMessage = error.response?.data['message'] ?? 'خطأ في الاستجابة من الخادم';
      } else {
        errorMessage = 'خطأ في الاتصال بالخادم';
      }
    } else if (error is ApiException) {
      errorMessage = error.message;
    } else if (error is NetworkException || error is TimeoutException) {
      errorMessage = error.toString();
    } else if (error is Exception) {
      errorMessage = error.toString();
    }

    AppDialog.show(
      context: context,
      title: 'خطأ',
      message: errorMessage,
      icon: Icons.error_outline,
      iconColor: Colors.red,
      confirmText: 'موافق',
    );
  }
}
