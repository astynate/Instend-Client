import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yexder_mobile_client/global/database/database.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/handlers/convert_handler.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/account/pages/login/login.dart';
import 'package:yexder_mobile_client/services/cloud/elements/avatar/avatar.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/button/button.dart';
import 'package:yexder_mobile_client/services/cloud/elements/header/statistic_item/statistic_item.dart';
import 'package:yexder_mobile_client/services/cloud/elements/popup/button/popup_button.dart';
import 'package:yexder_mobile_client/services/cloud/layout/layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/profile/profile_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/settings/settings_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

class ProfilePopup extends StatelessWidget {
  late ScrollController scrollController = ScrollController();
  late bool isOpen = true;
  
  ProfilePopup({super.key});

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.offset < -100 && isOpen == true) {
        Future.delayed(const Duration(milliseconds: 250), () {
          Navigator.of(context).pop();
        });

        isOpen = false;
      }
    });

    return Observer(
      builder: (context) {
        return Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvatarElement(
                      base64String: userState.user!.avatar ?? "", 
                      size: const Size(200, 200), 
                      borderRadius: 250
                    ),
                    Text(
                      userState.user?.nickname ?? "Undefinded", 
                      style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${userState.user?.name} ${userState.user?.surname}',
                      style: TextStyle(fontSize: 16.0, color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          StatisticItem(title: ConvertHandler.convertTokenValueToString(userState.user!.balance ?? 0), amount: "Tokens"),
                          const SizedBox(width: 5.0,),
                          StatisticItem(title: userState.user!.friendCount.toString(), amount: "Friends"),
                          const SizedBox(width: 5.0,),
                          StatisticItem(title: ConvertHandler.convertBytesToMB(userState.user!.occupiedSpace ?? 0), amount: "MB (ocp.)"),
                          const SizedBox(width: 5.0,),
                          StatisticItem(title: ConvertHandler.convertBytesToMB(userState.user!.storageSpace ?? 0), amount: "MB (total)"),
                        ]
                      ),
                    ),
                    SettingButton(
                      function: () {
                        applicationState.setCurrentIndex(ApplicationPages.profile.index);
                        applicationState.setBottomPanelState(true);
                        applicationState.setHeaderState(true);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Layout()),
                        );
                      },
                      icon: "assets/main/settings/account.svg",
                      text: "Profile", 
                      description: "In your profile you can share your thoughts, photos, videos and music you love with your friends. ",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SettingButton(
                        function: () {

                        },
                        icon: "assets/main/settings/messages.svg",
                        text: "Messages",
                        description: "Here you can communicate in personal chats, join servers and ask Cyra thinks you interested in.",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SettingButton(
                        function: () {

                        },
                        icon: "assets/main/settings/create.svg",
                        text: "Create",
                        description: "You can create publication or community, upload your photos, music and videos.",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SettingButton(
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SettingsPageLayout()),
                          );
                        },
                        icon: "assets/main/settings/settings.svg",
                        text: "Settings",
                        description: "Here you can set the color theme, notification settings, and manage your privacy.",
                      ),
                    ),
                  ]
                ),
              )
            ),
        );
      }
    );
  }
}