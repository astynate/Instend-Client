import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/database/database.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/interceptors/signalr_interceptor.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/theme_state.dart';
import 'package:yexder_mobile_client/main.dart';
import 'package:yexder_mobile_client/services/account/pages/main/account.dart';
import 'package:yexder_mobile_client/services/cloud/layout/layout.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  void makeRequest() async {
    final response = await httpClient.get('/accounts');

    if (!context.mounted) return;

    if (response.isSuccess == true && response.value?.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.value?.body ?? "") ?? List<dynamic>;

      if (result.length == 3) {
        UserModel user = UserModel.fromMap(result[0]); userState.setUser(user);

        user.systemAccessToken = await secureStorage.read(key: 'system_access_token');
        user.systemRefreshToken = await secureStorage.read(key: 'system_refresh_token');

        DatabaseService.instance.createOrUpdateRecord(user);
        signalR.connect();

        setDefaultColorTheme();

        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Layout()),
            (Route<dynamic> route) => false,
          );
        }

        return;
      }
    }

    String? theme = await secureStorage.read(key: 'brightness');

    if (theme != null) {
      colorTheme.setColorMode(theme == "light" ? 
        colorTheme.accountServiceLightTheme : colorTheme.accountServiceDarkTheme);
    } else {
      colorTheme.setColorMode(colorTheme.accountServiceLightTheme);
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AccountPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center( 
          child: Column(
            children: <Widget> [
              const Spacer(),
              CupertinoActivityIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 50),
              const Spacer(),
            ]
          )
        )
      ),
    );
  } 
}