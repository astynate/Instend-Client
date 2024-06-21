import 'package:flutter/material.dart';

class AccountPasswordField extends StatefulWidget {
  const AccountPasswordField({super.key});

  @override
  AccountPasswordFieldState createState() => AccountPasswordFieldState();
}

class AccountPasswordFieldState extends State<AccountPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}