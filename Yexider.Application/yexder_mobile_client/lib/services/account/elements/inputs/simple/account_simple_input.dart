import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSimpleInput extends StatefulWidget {
  String placeholder;
  Function(String) onChanged;
  String? defaultValue;
  TextInputType? type;
  bool isObscured;

  AccountSimpleInput({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.defaultValue,
    this.type = TextInputType.text,
    this.isObscured = false,
  });

  @override
  AccountSimpleInputState createState() => AccountSimpleInputState();
}

class AccountSimpleInputState extends State<AccountSimpleInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultValue);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            child: TextFormField(
              keyboardType: widget.type,
              obscureText: widget.isObscured,
              autocorrect: false,
              controller: _controller,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, decoration: TextDecoration.none),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                // hintText: widget.placeholder,
                labelText: widget.placeholder,
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                suffixIcon: widget.type == TextInputType.visiblePassword ? IconButton(
                  icon: Icon(
                    color: Theme.of(context).colorScheme.onPrimary,
                    widget.isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isObscured = !widget.isObscured;
                    });
                  },
                ) : null,
              ),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}