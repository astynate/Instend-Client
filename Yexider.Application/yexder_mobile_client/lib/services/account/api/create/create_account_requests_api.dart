import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yexder_mobile_client/global/models/system/result.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';
import '../../../../global/interceptors/main_interceptor.dart';

class CreateAccountAPI {
  static Future<Result<Response>> createAccount(UserTranferModel user) async {
    var result = await httpClient.post('/accounts', 
      object: jsonEncode(user.toJson()), 
      contentType: YexiderContentTypes.applicationJson
    );

    if (result.isSuccess == true) {
      debugPrint(result.value?.body);
    } else {
      debugPrint(result.error);
    }

    return result;
  }
}