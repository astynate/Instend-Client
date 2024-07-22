import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yexder_mobile_client/global/database/database.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/button/button.dart';
import 'package:yexder_mobile_client/services/cloud/elements/popup/button/popup_button.dart';
import 'package:yexder_mobile_client/services/cloud/pages/settings/pages/settings_account_page.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: SettingButton(
                  text: "Application theme", 
                  description: "Here you can adjust application appearance: brightness, colors and more.", 
                  icon: "assets/main/settings/color_mode.svg",
                  function: () {
                      
                  }
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 12.0),
              //   child: SettingButton(
              //     text: "Language", 
              //     description: "This setting does not affect your region selection (all text in this application will be translated to it).", 
              //     icon: "assets/main/settings/language.svg",
              //     function: () {
                      
              //     }
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 12.0),
              //   child: SettingButton(
              //     text: "Notifications", 
              //     description: "Here you can manage notifications from chats, groups, communities, friend requests and more.", 
              //     icon: "assets/main/settings/notifications.svg",
              //     function: () {
                      
              //     }
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SettingButton(
                  text: "Account", 
                  description: "Here you can change your name, surname, nickname, avatar, header and more.", 
                  icon: "assets/main/settings/account.svg",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsAccountPage(),
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SettingButton(
                  function: () {
                    applicationState.showBottomPanel(
                      context, 
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/company-logo.svg",
                                height: 60,
                                width: 60,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Yexider Account",
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: const Text(
                                    "Are you sure want to logout your Yexider Account? You can save your account data on this device before exiting.",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 34.0, left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    PopupButton(
                                      text: "Don't save",
                                      function: () async {
                                        await secureStorage.delete(key: "system_access_token");
                                        await secureStorage.delete(key: "system_refresh_token");
                      
                                        if (userState.user != null) {
                                          DatabaseService.instance.deleteModel(userState.user ?? UserModel.empthy());
                                        }
                      
                                        if (context.mounted) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const AuthorizationPage()),
                                          );
                                        }
                                      }
                                    ),
                                    PopupButton(
                                      text: "Save",
                                      isPrimary: true,
                                      function: () async {
                                        await secureStorage.delete(key: "system_access_token");
                                        await secureStorage.delete(key: "system_refresh_token");
                      
                                        if (context.mounted) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => const AuthorizationPage()),
                                            (Route<dynamic> route) => false,
                                          );
                                        }
                                      }
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      280
                    );
                  },
                  icon: "assets/main/settings/logout.svg",
                  text: "Logout",
                  description: "",
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}