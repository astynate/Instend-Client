import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/search/search.dart';
import 'package:yexder_mobile_client/services/cloud/pages/settings/pages/settings_main_page.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/main_header/main_header.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/navigation_panel/navigation_panel.dart';

class SettingsPageLayout extends StatelessWidget {
  const SettingsPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: applicationState.isHeaderOpen ? AppBar().preferredSize : const Size(0, 0),
            child: const YexiderHeader(title: "Settings")
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Search(text: "Search")
                  ),
                ),
                const SettingsMainPage()
              ],
            ),
          ),
          bottomNavigationBar: YexiderNavigationPanel(isOpen: applicationState.isBottomPanelOpen,),
        );
      }
    );
  }
}