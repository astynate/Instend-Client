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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            AccountHeader(title: "Create an Yexider ID", widgets: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: AccountSimpleInput(
                      placeholder: "Name", 
                      onChanged: (text) {
                        accountServiceState.changeName(text);
                      }, 
                      defaultValue: accountServiceState.newUser.name
                    ),
                  ),
                  AccountSimpleInput(
                    placeholder: "Surname", 
                    onChanged: (text) {
                      accountServiceState.changeSurname(text);
                    }, 
                    defaultValue: accountServiceState.newUser.surname
                  ),
                ],
              ),
            ]),
            const Spacer(),
            AccountFooter(
              children: [
                MainAccountButton.specificObject(
                  text: "Next",
                  type: AccountButtonTypes.primary,
                  context: context,
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
                MainAccountButton.specificObject(
                  text: "Back",
                  type: AccountButtonTypes.secondary,
                  context: context,
                  onPressed: () {
                    Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      ),
    );
  }
}