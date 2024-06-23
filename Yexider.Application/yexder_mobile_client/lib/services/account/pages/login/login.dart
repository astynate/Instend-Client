import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/pages/confirmation/confirm_email.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';
import 'package:yexder_mobile_client/services/cloud/layout/layout.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool isLoading = false;

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
                  setState(() {
                    email = text;
                  })
                }, type: TextInputType.emailAddress,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: AccountSimpleInput(
                    placeholder: "Password", 
                    onChanged: (text) => {
                      setState(() {
                        password = text;
                      })
                    }, 
                    type: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
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
              isLoading: isLoading,
              onPressed: () async {
                  if (ValidateHandler.validateString(email, 30) == false) {
                    applicationState.showAttentionMessage(context, "Invalid nickname or email");
                    return;
                  }

                  if (ValidateHandler.validatePassword(password) == false) {
                    applicationState.showAttentionMessage(context, "Invalid password");
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  var response = await httpClient.post(
                    "/authentication", 
                    contentType: YexiderContentTypes.none,
                    object: {'username': email, 'password': password}
                  );
                  
                  setState(() {
                    isLoading = false;
                  });

                  if (!context.mounted) return;

                  if (response.isFailure) {
                    applicationState.showError(context, YexiderSystemError("Attention!", response.error));
                    return;
                  }

                  if (response.value?.statusCode == 200) {
                    await secureStorage.write(key: 'system_access_token', value: response.value!.body);
                    await secureStorage.write(key: 'system_refresh_token', value: response.value?.headers['system_refresh_token']);

                    if (!context.mounted) return;

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const AuthorizationPage();
                    }));
                  } else if (response.value?.statusCode == 470 && ValidateHandler.validateGuid(response.value!.body)) {
                    accountServiceState.setConfimationLink(response.value!.body);

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const ConfirmEmailPage();
                    }));
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