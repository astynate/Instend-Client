import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => BottomNavigationBar(
        currentIndex: applicationState.currentIndex,
        onTap: (index) {
          debugPrint(index.toString());
          applicationState.setCurrentIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}