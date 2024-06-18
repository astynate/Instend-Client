import 'package:flutter/material.dart';

class AccountSimpleInput extends StatelessWidget {
  final String placeholder;
  const AccountSimpleInput({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintMaxLines: 20,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red), 
            ),
            labelStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)), 
            hintText: placeholder, 
            hintStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)), 
          ),
        )
    );
  }
}