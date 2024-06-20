import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class LoginPage extends StatelessWidget {
  final AccountServiceState state = AccountServiceState();
  
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          AccountHeader(title: "Login with Yexider ID", widgets: [
            Column(
              children: [
                AccountSimpleInput(placeholder: "Email or nickaname", onChanged: (text) => {
                  
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: AccountSimpleInput(placeholder: "Password", onChanged: (text) => {}),
                )
              ],
            ),
          ],),
          const Spacer(),
          AccountFooter(children: [
            MainAccountButton(
              text: "Next", 
              textColor: 
              Colors.black, 
              backgroundColor: 
              Colors.white, 
              onPressed: () async {
                  var response = await httpClient.get("/account");
                  
                  if (response.isSuccess) {
                    print('Response status: ${response.value}');
                  } else {
                    print(response.error);
                  }
              }
            ),
            MainAccountButton(
              text: "Back", 
              textColor: const Color.fromARGB(255, 255, 255, 255), 
              backgroundColor: const Color.fromARGB(255, 47, 47, 48), 
              onPressed: () {
                Navigator.pop(context);
              }
            )
          ])
        ],
      ),
    );
  }
}