class Validators {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال الاسم';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    final phoneRegex = RegExp(r'^[0-9]{6,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'رقم الهاتف غير صالح';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
    }
    return null;
  }

  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'هذا الحقل مطلوب';
    }
    return null;
  }

  // مثال لتاريخ الميلاد (يمكنك تعديله حسب الحاجة)
  static String? birthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال تاريخ الميلاد';
    }
    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'تاريخ الميلاد غير صالح';
    }
  }
}
