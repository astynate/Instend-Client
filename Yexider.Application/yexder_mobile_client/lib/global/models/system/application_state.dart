import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/handlers/convert_handler.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/services/cloud/elements/avatar/avatar.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/Title/title.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/button_block/button_block.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/statistic_item/statistic_item.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

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

  void showModalBottomPanel(BuildContext context, UserModel user) {
    setBottomPanelState(false);
    setHeaderState(false);

    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AvatarElement(
                              base64String: userState.user?.avatar ?? "", 
                              size: const Size(120, 120), 
                              borderRadius: 150
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    userState.user?.nickname ?? "Undefinded", 
                                    style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${userState.user?.name} ${userState.user?.surname}',
                                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              StatisticItem(title: ConvertHandler.convertTokenValueToString(user.balance ?? 0), amount: "Tokens"),
                              const SizedBox(width: 5.0,),
                              StatisticItem(title: user.friendCount.toString(), amount: "Friends"),
                              const SizedBox(width: 5.0,),
                              StatisticItem(title: ConvertHandler.convertBytesToMB(user.storageSpace ?? 0), amount: "MB (ocp.)"),
                              const SizedBox(width: 5.0,),
                              StatisticItem(title: ConvertHandler.convertBytesToMB(user.storageSpace ?? 0), amount: "MB (total)"),
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            SettingsTitle(title: "Actions"),
                            ButtonBlock(buttons: [
                              ButtonElement(title: "Profile"),
                              ButtonElement(title: "Notifications"),
                              ButtonElement(title: "Create"),
                              ButtonElement(title: "Messages"),
                            ]),
                            SettingsTitle(title: "Actions"),
                            ButtonBlock(buttons: [
                              ButtonElement(title: "Profile"),
                              ButtonElement(title: "Notifications"),
                              ButtonElement(title: "Create"),
                              ButtonElement(title: "Messages"),
                            ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).closed.then((value) {
      setBottomPanelState(true);
      setHeaderState(true);
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
}

ApplicationState applicationState = ApplicationState();
FlutterSecureStorage secureStorage = const FlutterSecureStorage();