import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const AccountHeader(title: "Collections, Music, Gallery.\n Only in Yexider."),
          const Spacer(),
          AccountFooter(children: [
            MainAccountButton(
              text: "Login", 
              textColor: 
              Colors.black, 
              backgroundColor: 
              Colors.white, 
              onPressed: () {}
            ),
            MainAccountButton(
              text: "Sign up", 
              textColor: const Color.fromARGB(255, 255, 255, 255), 
              backgroundColor: const Color.fromARGB(255, 41, 42, 43), 
              onPressed: () {}
            )
          ])
        ],
      ),
    );
  }
}