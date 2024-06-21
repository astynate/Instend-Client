import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/elements/logo/account_logo.dart';
import 'package:yexder_mobile_client/services/account/elements/title/account_page_title.dart';

class AccountHeader extends StatelessWidget {
  final String title;
  final List<Widget> widgets;

  const AccountHeader({super.key, required this.title, required this.widgets});

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
            child: Column(
              children: [
                AccountPageTitle(text: title),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(children: widgets)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}