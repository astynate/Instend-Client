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
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        keyboardType: widget.type,
        obscureText: widget.isObscured,
        autocorrect: false,
        controller: _controller,
        style: const TextStyle(color: Colors.white, decoration: TextDecoration.none),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
          hintText: widget.placeholder,
          labelText: widget.placeholder,
          hintStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
          suffixIcon: widget.type == TextInputType.visiblePassword ? IconButton(
            icon: Icon(
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
    );
  }
}