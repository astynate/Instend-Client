import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/navigation_panel/navigation_panel.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final List<Widget> _pages = [
    // Здесь добавьте ваши страницы (виджеты) для каждого элемента нижней панели
    // Например:
    // MyPage1(),
    // MyPage2(),
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('!');

    return Scaffold(
      body: _pages[applicationState.currentIndex],
      bottomNavigationBar: const NavigationPanel()
    );
  }
}