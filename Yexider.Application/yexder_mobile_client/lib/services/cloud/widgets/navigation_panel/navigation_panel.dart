import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';

class NavigationPanel extends StatelessWidget {
  final int _currentIndex = 0;

  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        applicationState.setCurrentIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
      ],
    );
  }
}