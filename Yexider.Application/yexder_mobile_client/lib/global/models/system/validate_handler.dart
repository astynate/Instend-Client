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
}