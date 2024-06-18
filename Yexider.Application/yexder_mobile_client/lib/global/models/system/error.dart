import 'dart:core';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';

class YexiderSystemError {
  late String title = "Attention!";
  late String message = "Something went wrong";
  late int level = 0;

  YexiderSystemError(String titleValue, String messageValue, int? levelValue) {
    if (ValidateHandler.validateString(titleValue, 12) == true) {
      title = titleValue;
    }

    if (ValidateHandler.validateString(messageValue, 25) == true) {
      message = messageValue;
    }

    if (levelValue != null && level > 0) {
      level = levelValue;
    }
  }
}