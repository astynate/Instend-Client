import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CodeInputField extends StatelessWidget {
  final Function(String value) setString;
  final List<String> code = List.generate(6, (index) => '');
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  CodeInputField({super.key, required this.setString});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            for (int i = 0; i < 6; i++)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    child: TextField(
                      focusNode: focusNodes[i],
                      onChanged: (value) {
                        code[i] = value;
                        setString(code.join(''));

                        if (value.isEmpty) {
                          if (i > 0) {
                            FocusScope.of(context).requestFocus(focusNodes[i - 1]);
                          }
                        } else {
                          if (i < 5) {
                            FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                          }
                        }
                      },
                      // textCapitalization: TextCapitalization.sentences,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelStyle: TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                        hintStyle: TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}