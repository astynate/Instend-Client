import 'package:flutter/material.dart';

class PopupHandler {
  static void showPopUpField(
    BuildContext context, 
    String title, 
    String placeholder, 
    Future<bool> Function() okFunction, 
    void Function(String text) setTextField
  ) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            actionsPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            buttonPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            contentPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(title, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary), textAlign: TextAlign.center),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: placeholder
                ),
                onChanged: setTextField,
                autofocus: true,
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final result = await okFunction();

                      if (result == true && context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Ok', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                ]
              ),
            ],
          ),
        );
      },
    );
  }
}