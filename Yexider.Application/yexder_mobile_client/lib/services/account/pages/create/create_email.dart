import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class CreateEmailPage extends StatefulWidget {
  final UserTranferModel userTransfer;
  const CreateEmailPage({super.key, required this.userTransfer});

  @override
  State<CreateEmailPage> createState() => _CreateEmailPageState();
}

class _CreateEmailPageState extends State<CreateEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const AccountHeader(title: "Create an Yexider ID", widgets: [
            Column(
              children: [
                AccountSimpleInput(placeholder: "Enter your email"),
              ],
            ),
          ],),
          const Spacer(),
          AccountFooter(
            children: [
              MainAccountButton(
                text: "Next",
                textColor: Colors.black,
                backgroundColor: Colors.white,
                onPressed: () {},
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
    );
  }
}