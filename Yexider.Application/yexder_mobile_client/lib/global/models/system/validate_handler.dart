class ValidateHandler {
  static bool validateString(String? value, int maxLength) {
    if (value == null || value == '') {
      return false;
    }

    if (value.length > maxLength) {
      return false;
    }

    return true;
  }

  static bool validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
}