import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/handlers/statusbar_handler.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/profile_popup/profile_popup.dart';

part 'application_state.g.dart';

class ApplicationState = ApplicationServiceState with _$ApplicationState;

abstract class ApplicationServiceState with Store {
  @observable
  int currentIndex = 0;

  @observable
  bool isBottomPanelOpen = true;

  @observable
  bool isHeaderOpen = true;

  void showError(BuildContext context, YexiderSystemError error) {
    StatusBarTheme theme = StatusbarHandler.statusBarTheme;
    StatusbarHandler.setDarkTheme();
    
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            actionsPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            buttonPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            contentPadding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(error.title, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary), textAlign: TextAlign.center),
            content: Text(error.message, style: TextStyle(color: Theme.of(context).colorScheme.onSecondary), textAlign: TextAlign.center),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    if (theme == StatusBarTheme.light) {
                      StatusbarHandler.setLightTheme();
                    } else {
                      StatusbarHandler.setDarkTheme();
                    }
                    
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
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),),
        showCloseIcon: true,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showProfileBottomPanel(BuildContext context, UserModel user) {
    setBottomPanelState(false);
    setHeaderState(false);

    Scaffold.of(context).showBottomSheet(
      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      backgroundColor: Theme.of(context).colorScheme.surface,
      (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: Container(
                    width: 50.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              ProfilePopup()
            ],
          )
        );
      },
    ).closed.then((value) {
      setBottomPanelState(true);
      setHeaderState(true);
    });
  }

  void showBottomPanel(BuildContext context, Widget widget, double height) {
    setHeaderState(true);
    setBottomPanelState(false);
    StatusbarHandler.setCustomTheme(Brightness.dark, Theme.of(context).colorScheme.tertiary);

    Scaffold.of(context).showBottomSheet(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      (BuildContext context) {
        return Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: Container(
              //     width: 50.0,
              //     height: 4.0,
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).colorScheme.onPrimary,
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //   ),
              // ),
              widget
            ],
          ), 
        );
      },
    ).closed.then((value) {
      setBottomPanelState(true);

      if (StatusbarHandler.statusBarTheme == StatusBarTheme.light) {
        StatusbarHandler.setLightTheme();
      } else {
        StatusbarHandler.setDarkTheme();
      }
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

  @action
  void setHeaderState(bool state) {
    isHeaderOpen = state;
  }

  void setAdaptiveOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown
    ]);
  }
  
  void setOrientationUp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}

ApplicationState applicationState = ApplicationState();
FlutterSecureStorage secureStorage = const FlutterSecureStorage();