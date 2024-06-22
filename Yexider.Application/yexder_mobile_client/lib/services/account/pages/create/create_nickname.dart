import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/pages/create/create_name.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class CreateNicknamePage extends StatelessWidget {
  const CreateNicknamePage({super.key});

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
                  AccountSimpleInput(placeholder: "Nickname", onChanged: (text) {
                    accountServiceState.changeNickname(text);
                  }, defaultValue: accountServiceState.newUser.nickname),
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
                  onPressed: () {
                    if (ValidateHandler.validateString(accountServiceState.newUser.nickname.toString(), 20) == true) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const CreateNamePage();
                      }));
                    } else {
                      applicationState.showAttentionMessage(context, 
                        "Invalid nickname!");
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
