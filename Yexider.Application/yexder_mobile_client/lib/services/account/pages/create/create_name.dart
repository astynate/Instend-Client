import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/pages/create/create_password.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class CreateNamePage extends StatelessWidget {
  const CreateNamePage({super.key});

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
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: AccountSimpleInput(placeholder: "Name", onChanged: (text) {
                      accountServiceState.changeName(text);
                    }, defaultValue: accountServiceState.newUser.name),
                  ),
                  AccountSimpleInput(placeholder: "Surname", onChanged: (text) {
                    accountServiceState.changeSurname(text);
                  }, defaultValue: accountServiceState.newUser.surname),
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
                    if (ValidateHandler.validateString(accountServiceState.newUser.name.toString(), 20) == false) {
                      applicationState.showAttentionMessage(context, "Invalid name!");
                      return;
                    }

                    if (ValidateHandler.validateString(accountServiceState.newUser.surname.toString(), 20) == false) {
                      applicationState.showAttentionMessage(context, "Invalid surname!");
                      return;
                    }

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const CreatePasswordPage();
                    }));
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
