class ValidateHandler {
  static RegExp guidRegexExpression = RegExp(r'[({]?[a-fA-F0-9]{8}[-]?([a-fA-F0-9]{4}[-]?){3}[a-fA-F0-9]{12}[})]?');

  static bool validateString(String? value, int maxLength) {
    if (value == null || value == "null" || value == '') {
      return false;
    }

    if (value.length > maxLength) {
      return false;
    }

    return true;
  }

  static bool validateGuid(String value) {
    return guidRegexExpression.hasMatch(value) == true;
  }

  static bool validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  static bool validatePassword(String? value) {
    return value != null && validateString(value, 20) && value.length > 8;
  }
}