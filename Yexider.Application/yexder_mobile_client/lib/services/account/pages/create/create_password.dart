import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/services/account/api/create/create_account_requests_api.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/pages/confirmation/confirm_email.dart';
import 'package:yexder_mobile_client/services/account/state/account_sevice_state.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  CreatePasswordPageState createState() => CreatePasswordPageState();
}

class CreatePasswordPageState extends State<CreatePasswordPage> {
  bool isLoading = false;

  void setLoadingState(bool state) {
    setState(() {
      isLoading = state;
    });
  }

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
                    child: AccountSimpleInput(
                      placeholder: "Password", 
                      onChanged: (text) {
                        accountServiceState.changePassword(text);
                      }, 
                      defaultValue: accountServiceState.newUser.password,
                      type: TextInputType.visiblePassword,
                      isObscured: true,
                    ),
                  ),
                  AccountSimpleInput(
                    placeholder: "Confirm password", 
                    onChanged: (text) {
                      accountServiceState.changeConfirmPassword(text);
                    }, 
                    defaultValue: accountServiceState.newUser.confirmPassword,
                    type: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
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
                  isLoading: isLoading,
                  onPressed: () async {
                    if (ValidateHandler.validatePassword(accountServiceState.newUser.password.toString()) == false) {
                      applicationState.showAttentionMessage(context, "Invalid password");
                      return;
                    }

                    if (ValidateHandler.validatePassword(accountServiceState.newUser.confirmPassword.toString()) == false) {
                      applicationState.showAttentionMessage(context, "Passwords must be the same.");
                      return;
                    }

                    setLoadingState(true);
                    var result = await CreateAccountAPI.createAccount(accountServiceState.newUser);
                    setLoadingState(false);
                    
                    String body = result.value?.body ?? "";

                    if (!context.mounted) return;

                    if ((result.isFailure == true) || 
                        (result.isSuccess && result.value!.statusCode != 200) || 
                        (result.isSuccess && ValidateHandler.validateGuid(body) == false)) 
                    {
                      applicationState.showError(context, YexiderSystemError("Attention", result.error));
                    } 
                    else if (context.mounted) {
                      accountServiceState.setConfimationLink(body);

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ConfirmEmailPage();
                      }));
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