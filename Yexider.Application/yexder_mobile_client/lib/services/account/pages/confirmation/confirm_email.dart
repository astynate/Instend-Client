import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/code/code.dart';
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
                CodeInputField(setString: (value) => {}),
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
                    debugPrint('Response status: ${response.value}');
                  } else {
                    debugPrint(response.error);
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