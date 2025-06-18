class Validators {
  static String? name(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return 'الرجاء إدخال الاسم';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
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

  static String? confirmPassword(String? value, String passwordValue) {
    if (value!.length < 6) {
      return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
    }
    if (value.isEmpty) {
      return 'الرجاء تأكيد كلمة المرور';
    }
    if (value != passwordValue) {
      return 'كلمة المرور وتأكيدها غير متطابقين';
    }
    return null;
  }

  static String? birthDate(DateTime? date, {int minAge = 18, int? maxAge}) {
    if (date == null) {
      return 'الرجاء اختيار تاريخ الميلاد';
    }

    final now = DateTime.now();
    final age = now.year - date.year -
        (now.isBefore(DateTime(now.year, date.month, date.day)) ? 1 : 0);

    if (age < minAge) {
      return 'يجب أن يكون عمرك على الأقل $minAge سنة';
    }

    if (maxAge != null && age > maxAge) {
      return 'يجب أن يكون عمرك أقل من $maxAge سنة';
    }

    if (date.isAfter(now)) {
      return 'تاريخ الميلاد لا يمكن أن يكون في المستقبل';
    }

    return null;
  }
  static String? city(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return 'الرجاء اختيار المدينة';
    }
    return null;
  }

  static String? district(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return 'الرجاء إدخال المنطقة';
    }
    return null;
  }

  static String? required(String? value, {String? message}) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return message ?? 'هذا الحقل مطلوب';
    }
    return null;
  }
}
