import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';

class ApplicationState {
  void showError(BuildContext context, YexiderSystemError error) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(error.title, style: const TextStyle(color: Colors.white),),
        content: Text(error.message, style: const TextStyle(color: Color.fromARGB(255, 177, 177, 177)),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok', style: TextStyle(color: CupertinoColors.activeBlue),),
          ),
        ],
      ),
    );
  }
}

ApplicationState applicationState = ApplicationState();