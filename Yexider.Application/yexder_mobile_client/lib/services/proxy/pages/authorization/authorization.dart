import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
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
        UserModel user = UserModel.fromMap(result[0]);
        userState.setUser(user);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Layout()),
        );

        return;
      }

      debugPrint(userState.user?.name.toString());
      debugPrint(userState.friends?[0].toString());
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AccountPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center( 
        child: Column(
          children: <Widget> [
            Spacer(),
            CupertinoActivityIndicator(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(width: 50),
            Spacer(),
          ]
        )
      )
    );
  } 
}