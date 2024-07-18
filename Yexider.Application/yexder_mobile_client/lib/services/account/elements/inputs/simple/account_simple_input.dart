import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSimpleInput extends StatefulWidget {
  String? text;
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
    this.text,
  });

  @override
  AccountSimpleInputState createState() => AccountSimpleInputState(text);
}

class AccountSimpleInputState extends State<AccountSimpleInput> {
  late TextEditingController _controller;
  String? text;

  AccountSimpleInputState(this.text);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10.0, top: 5.0),
                child: TextFormField(
                  keyboardType: widget.type,
                  obscureText: widget.isObscured,
                  autocorrect: false,
                  controller: _controller,
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, decoration: TextDecoration.none),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w500),
                    labelText: widget.placeholder,
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                    suffixIcon: widget.type == TextInputType.visiblePassword ? IconButton(
                      icon: Icon(
                        widget.isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
                        color: Theme.of(context).colorScheme.onPrimary,
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
          if (text != null) 
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Text(
                  text ?? "None",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}