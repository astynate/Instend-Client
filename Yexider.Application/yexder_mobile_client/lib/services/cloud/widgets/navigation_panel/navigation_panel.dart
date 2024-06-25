import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/navigation_button/navigation_button.dart';

class YexiderNavigationPanel extends StatelessWidget {
  const YexiderNavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color.fromARGB(255, 48, 48, 48)), // Adjust color as needed
          ),
        ),
        child: BottomAppBar(
          height: 56,
          elevation: 0,
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                YexiderNavigationButton(
                  defaultIcon: "assets/main/navigation/passive_icons/home_passive.svg",
                  selectedIcon: "assets/main/navigation/active_icons/home_active.svg",
                  index: 0,
                  currentIndex: applicationState.currentIndex,
                  onPressed: (indexValue) {
                    applicationState.setCurrentIndex(indexValue);
                  },
                ),
                YexiderNavigationButton(
                  defaultIcon: "assets/main/navigation/passive_icons/explore_passive.svg",
                  selectedIcon: "assets/main/navigation/active_icons/explore_active.svg",
                  index: 1,
                  currentIndex: applicationState.currentIndex,
                  onPressed: (indexValue) {
                    applicationState.setCurrentIndex(indexValue);
                  },
                ),
                YexiderNavigationButton(
                  defaultIcon: "assets/main/navigation/passive_icons/cloud_passive.svg",
                  selectedIcon: "assets/main/navigation/active_icons/cloud_active.svg",
                  index: 2,
                  currentIndex: applicationState.currentIndex,
                  onPressed: (indexValue) {
                    applicationState.setCurrentIndex(indexValue);
                  },
                ),
                YexiderNavigationButton(
                  defaultIcon: "assets/main/navigation/passive_icons/gallery_passive.svg",
                  selectedIcon: "assets/main/navigation/active_icons/gallery_active.svg",
                  index: 3,
                  currentIndex: applicationState.currentIndex,
                  onPressed: (indexValue) {
                    applicationState.setCurrentIndex(indexValue);
                  },
                ),
                YexiderNavigationButton(
                  defaultIcon: "assets/main/navigation/passive_icons/music_passive.svg",
                  selectedIcon: "assets/main/navigation/active_icons/music_active.svg",
                  index: 4,
                  currentIndex: applicationState.currentIndex,
                  onPressed: (indexValue) {
                    applicationState.setCurrentIndex(indexValue);
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}