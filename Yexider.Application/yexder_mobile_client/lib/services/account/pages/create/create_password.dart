import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';
import 'package:http/http.dart' as http;

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            AccountHeader(title: "Create an Yexider ID", widgets: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: AccountSimpleInput(placeholder: "Password", onChanged: (text) {
                      accountServiceState.changePassword(text);
                    }),
                  ),
                  AccountSimpleInput(placeholder: "Confirm password", onChanged: (text) {
                    accountServiceState.changeConfirmPassword(text);
                  }),
                ],
              ),
            ]),
            const Spacer(),
            AccountFooter(
              children: [
                MainAccountButton(
                  text: "Next",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    if (ValidateHandler.validatePassword(accountServiceState.newUser.password.toString()) == true &&
                        ValidateHandler.validatePassword(accountServiceState.newUser.confirmPassword.toString()) == true && 
                        accountServiceState.newUser.password.toString() == accountServiceState.newUser.confirmPassword.toString()
                    ) 
                    {
                      // var result = await httpClient.post('/accounts', null, {'user': accountServiceState.newUser});
                      
                      final newUserJson = jsonEncode(accountServiceState.newUser);

                      http.post(Uri.parse('http://localhost:5000/accounts'), body: newUserJson);

                      // if (result.isSuccess == true) {
                      //   print("!");
                      //   print(result.value?.body);
                      // } else {
                      //   print(result.error);
                      // }
                    }
                  },
                ),
                MainAccountButton(
                  text: "Back",
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 41, 42, 43),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
