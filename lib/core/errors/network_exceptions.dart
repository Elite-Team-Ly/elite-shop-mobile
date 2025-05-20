class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'لا يوجد اتصال بالإنترنت']);

  @override
  String toString() => 'NetworkException: $message';
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException([this.message = 'انتهت مهلة الاتصال بالخادم']);

  @override
  String toString() => 'TimeoutException: $message';
}
