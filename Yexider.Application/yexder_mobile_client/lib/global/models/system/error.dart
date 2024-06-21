import 'dart:core';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';

class YexiderSystemError {
  String title = "Attention!";
  String message = "Something went wrong";
  int level = 0;

  YexiderSystemError(String titleValue, String messageValue, {int? levelValue}) {
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