import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';

part 'application_state.g.dart';

class ApplicationState = ApplicationServiceState with _$ApplicationState;

abstract class ApplicationServiceState with Store {
  @observable
  int currentIndex = 0;

  void showError(BuildContext context, YexiderSystemError error) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            actionsPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            buttonPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            contentPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            backgroundColor: const Color.fromARGB(255, 48, 48, 48),
            title: Text(error.title, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center),
            content: Text(error.message, style: const TextStyle(color: Color.fromARGB(255, 177, 177, 177)), textAlign: TextAlign.center),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok', style: TextStyle(color: CupertinoColors.activeBlue)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showAttentionMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        showCloseIcon: true,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showModalBottomPanel(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).colorScheme.onSecondary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }
}

ApplicationState applicationState = ApplicationState();
FlutterSecureStorage secureStorage = const FlutterSecureStorage();