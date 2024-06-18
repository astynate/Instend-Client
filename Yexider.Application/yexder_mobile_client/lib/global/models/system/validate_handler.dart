class ValidateHandler {
  static bool ValidateString(String? value, int? maxLength) {
    if (value == null || value == '') {
      return false;
    }

    return true;
  }
}