class Failure {
  final String message;
  final int? code; // اختياري: كود الخطأ مثل 400 أو 500
  final FailureType type; // نوع الخطأ: شبكة، سيرفر، ...إلخ

  Failure({
    required this.message,
    this.code,
    this.type = FailureType.general,
  });

  @override
  String toString() => 'Failure(message: $message, code: $code, type: $type)';
}

enum FailureType {
  network,
  server,
  unauthorized,
  validation,
  notFound,
  timeout,
  general,
}
