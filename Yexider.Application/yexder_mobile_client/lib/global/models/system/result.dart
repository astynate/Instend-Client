class Result<type> {
  late String error = "Something went wrong";
  late type? value;
  bool isFailure = true;

  type? getValue() {
    if (isFailure == true) {
      throw Exception(error);
    }
    return value;
  }

  String errorMessage() {
    if (isFailure == false) {
      throw Exception("Result of the operation: success");
    }
    return error;
  }

  void success(type newValue) {
    isFailure = false;
    value = newValue;
    error = "Something went wrong";
  }

  void failure(String error) {
    isFailure = true;
    value = null;
    error = error;
  }
}