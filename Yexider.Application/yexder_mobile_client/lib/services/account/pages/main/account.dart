import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/pages/confirmation/confirm_email.dart';
import 'package:yexder_mobile_client/services/account/pages/create/create_email.dart';
import 'package:yexder_mobile_client/services/account/pages/login/login.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const AccountHeader(
            title: "Collections, Music, Gallery.\n Only in Yexider.", 
            widgets: [],
          ),
          const Spacer(),
          AccountFooter(children: [
            MainAccountButton(
              text: "Login", 
              textColor: Colors.black, 
              backgroundColor: Colors.white, 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              }
            ),
            MainAccountButton(
              text: "Sign up", 
              textColor: const Color.fromARGB(255, 255, 255, 255), 
              backgroundColor: const Color.fromARGB(255, 41, 42, 43), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateEmailPage(),
                  ),
                );
              }
            )
          ])
        ],
      ),
    );
  }
}