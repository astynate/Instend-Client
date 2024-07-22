import 'dart:convert';
import 'package:http/http.dart';
import 'package:yexder_mobile_client/global/models/system/result.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';
import '../../../../global/interceptors/main_interceptor.dart';

class AccountAPI {
  static Future<Result<Response>> createAccount(UserTranferModel user) async {
    var result = await httpClient.post(
      '/accounts', 
      object: jsonEncode(user.toJson()), 
      contentType: YexiderContentTypes.applicationJson
    );

    return result;
  }

  static Future<Result<Response>> updateAccount(
    String? name, 
    String? surname, 
    String? nickname, 
    String? avatar,
    String? header
  ) async {
    
    Map<String, String> userDTO = {
      "name": name ?? "",
      "surname": surname ?? "",
      "nickname": nickname?? "",
      "avatar": avatar ?? "",
      "header": header ?? "",
    };

    final result = await httpClient.put(
      "/accounts", 
      object: userDTO,
      contentType: YexiderContentTypes.none,
    );

    return result;
  }
}