import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';

class AccountFooter extends StatelessWidget {
  final List<MainAccountButton> children;
  const AccountFooter({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: children.map((child) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: child,
            )).toList(),
          ),
        ),
      ],
    );
  }
}