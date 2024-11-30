class AppValidator {
  static String? phoneValidate(String? value) {
    final phoneRegExp = RegExp(r'^\+?\d{8,14}$');
    if (value == null || !phoneRegExp.hasMatch(value)) {
      return 'invalidPhone';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || !emailRegExp.hasMatch(value)) {
      return 'invalidEmail';
    }
    return null;
  }

  static String? passwordValidate(String? value) {
    if (value == null || value.length < 6) {
      return 'invalidPassword';
    }
    return null;
  }

  static String? nameValidate(String? value) {
    if (value == null || value.length < 2) {
      return 'invalidName';
    }
    return null;
  }

  static String? stringValidate(String? value) {
    if (value == null || value.length < 3) {
      return 'invalidName';
    }
    return null;
  }

  static String? dateValidate(String? value) {
    try {
      DateTime.parse(value ?? '');
      return null;
    } catch (e) {
      return 'invalidDate';
    }
  }

  // format:H:i
  static String? timeValidate(String? value) {
    final timeRegExp = RegExp(
        r'^(?:(1[0-2]|0?[1-9]):([0-5][0-9])\s?(AM|PM))|([01][0-9]|2[0-3]):([0-5][0-9])$');
    if (value == null || !timeRegExp.hasMatch(value)) {
      return 'invalidTime';
    }
    return null;
  }

  static String? numberValidate(String? value) {
    if ((double.tryParse(value ?? '') ?? -1) < 0) {
      return 'invalidNum';
    }
    return null;
  }
}
