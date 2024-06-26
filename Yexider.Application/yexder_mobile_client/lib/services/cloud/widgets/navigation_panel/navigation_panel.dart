import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/navigation_button/navigation_button.dart';

class YexiderNavigationPanel extends StatefulWidget {
  final bool isOpen;

  const YexiderNavigationPanel({super.key, required this.isOpen});

  @override
  State<YexiderNavigationPanel> createState() => _YexiderNavigationPanelState();
}

class _YexiderNavigationPanelState extends State<YexiderNavigationPanel> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(seconds: 1);
    controller.reverseDuration = const Duration(seconds: 1);
    controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color.fromARGB(255, 48, 48, 48)),
          ),
        ),
        child: BottomAppBar(
          height: widget.isOpen ? 56 : 0,
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