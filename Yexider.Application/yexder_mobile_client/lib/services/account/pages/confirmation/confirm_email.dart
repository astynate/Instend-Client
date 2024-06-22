import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/code/code.dart';
import 'package:yexder_mobile_client/services/account/pages/login/login.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          AccountHeader(title: "Confirm your email", widgets: [
            Column(
              children: [
                CodeInputField(setString: (value) => {
                  accountServiceState.setConfimationCode(value)
                }),
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
                var response = await httpClient.post('/confirmations?link=${accountServiceState.confirmationLink}&code=${accountServiceState.confirmationCode}');
                
                if (!context.mounted) return;

                if (response.isSuccess) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                } else {
                  applicationState.showError(context, YexiderSystemError('Attention!', response.error));
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