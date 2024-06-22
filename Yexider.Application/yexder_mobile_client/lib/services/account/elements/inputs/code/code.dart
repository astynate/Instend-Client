import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CodeInputField extends StatelessWidget {
  final Function(String value) setString;
  final List<String> code = List.generate(6, (index) => '');

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
                  padding: EdgeInsets.only(right: i == 5 ? 0 : 10),
                  child: SizedBox(
                    child: TextField(
                      onChanged: (value) {
                        code[i] = value;
                        debugPrint(code.join(''));
                      },
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelStyle: TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
                        hintStyle: TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
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