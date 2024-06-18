import 'package:flutter/cupertino.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/services/account/pages/main/account.dart';

void main() {
  runApp(const YexiderApplication());
}

class YexiderApplication extends StatelessWidget {
  const YexiderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: YexiderSystem(),
    );
  }
}

class YexiderSystem extends StatefulWidget {
  const YexiderSystem({super.key});

  @override
  YexiderSystemWidget createState() => YexiderSystemWidget();
}

class YexiderSystemWidget extends State<YexiderSystem> {
  final List<YexiderSystemError> _errorQueue = [];

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: AccountPage(),
    );
  }

  void addErrorToQueue(BuildContext context, String errorTitle, String errorMessage, int? level) {
    _errorQueue.add(YexiderSystemError(errorTitle, errorMessage, level));

    if (_errorQueue.length == 1) {
      _showNextError(context);
    }
  }

  void _showNextError(BuildContext context) {
    if (_errorQueue.isNotEmpty) {
      YexiderSystemError error = _errorQueue.first;

      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(error.title),
            content: Text(error.message),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _errorQueue.removeAt(0);
                  if (_errorQueue.isNotEmpty) {
                    _showNextError(context);
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }
}

// Yexider Mobile Client.
// © Andreev S, 2024 — Minsk, Belarus.