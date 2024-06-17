import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/elements/logo/account_logo.dart';
import 'package:yexder_mobile_client/services/account/elements/title/account_page_title.dart';

class AccountHeader extends StatelessWidget {
  final String title;
  const AccountHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final double marginBottom = screenHeight * 0.1;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: AccountLogo(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: marginBottom),
            child: AccountPageTitle(text: title),
          ),
        ],
      ),
    );
  }
}