import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/services/account/pages/main/account.dart';
import 'package:yexder_mobile_client/services/cloud/layout/layout.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Layout()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );
    }
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
              color: Colors.white,
            ),
            SizedBox(width: 50),
            Spacer(),
          ]
        )
      )
    );
  } 
}