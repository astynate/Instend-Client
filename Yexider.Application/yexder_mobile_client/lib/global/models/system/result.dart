/// Yexider Result Generic Type.
/// (c) Andreev S, 2024 — Minsk, Belarus.
/// To use: wrap your type in Result<>.
/// if your result faluture write — return Result<type>().faluture("Error message").
/// if your result success write — return Result<type>().success(variable).
class Result<type> {
  late String error = "Something went wrong";
  late type? value;
  
  bool isFailure = true;
  bool isSuccess = false;

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

  Result<type> success(type newValue) {
    isFailure = false;
    isSuccess = !isFailure;
    value = newValue;
    error = "Something went wrong";

    return this;
  }

  Result<type> failure(String error) {
    isFailure = true;
    isSuccess = !isFailure;
    value = null;
    error = error;

    return this;
  }
}