import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/services/account/pages/main/account.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/home_page.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  void makeRequest() async {
    final response = await httpClient.get('/accounts');

    if (response.isSuccess == true && response.value?.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
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
      backgroundColor: Colors.black,
      body: Center( 
        child: Column(
          children: <Widget> [
            Spacer(),
            CupertinoActivityIndicator(
              color: Colors.white,
            ),
            SizedBox(width: 50),
            // Padding(padding: EdgeInsets.only(top: 5)),
            // Text('Loading', 
            //   style: TextStyle(
            //     color: Color.fromARGB(255, 49, 49, 49),
            //     fontWeight: FontWeight.bold
            //   ),
            // ),
            Spacer(),
          ]
        )
      )
    );
  } 
}