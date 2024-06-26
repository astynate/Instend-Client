import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/services/cloud/elements/avatar/avatar.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

part 'application_state.g.dart';

class ApplicationState = ApplicationServiceState with _$ApplicationState;

abstract class ApplicationServiceState with Store {
  @observable
  int currentIndex = 0;

  @observable
  bool isBottomPanelOpen = true;

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
    setBottomPanelState(false);

    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: const Border(top: BorderSide(color: Color.fromARGB(255, 88, 88, 88)),),
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 16.0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 40.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        AvatarElement(
                          base64String: userState.user?.avatar ?? "", 
                          size: const Size(80, 80), 
                          borderRadius: 100
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userState.user?.nickname ?? "Undefinded", 
                                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${userState.user?.name} ${userState.user?.surname}',
                                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).closed.then((value) {
      setBottomPanelState(true);
    });
  }

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void setBottomPanelState(bool state) {
    isBottomPanelOpen = state;
  }
}

ApplicationState applicationState = ApplicationState();
FlutterSecureStorage secureStorage = const FlutterSecureStorage();