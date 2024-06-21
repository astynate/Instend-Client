import 'package:flutter/cupertino.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  CodeInputFieldState createState() => CodeInputFieldState();
}

class CodeInputFieldState extends State<CodeInputField> {
  List<String> code = List<String>.filled(6, '');

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.systemGrey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      maxLength: 6,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          if (value.length <= 6) {
            code = value.split('');
          }
        });
      },
      // buildCounter: (BuildContext context,
      //     {required int currentLength, required int maxLength, required bool isFocused}) => null,
      cursorColor: CupertinoColors.activeBlue,
      style: const TextStyle(fontSize: 18.0),
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      obscureText: true,
      autocorrect: false,
      enableSuggestions: false,
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: code.join(),
          selection: TextSelection.collapsed(offset: code.length),
        ),
      ),
    );
  }
}