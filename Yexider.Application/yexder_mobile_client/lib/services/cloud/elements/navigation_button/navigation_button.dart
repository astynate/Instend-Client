import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -1,  0,  0, 0, 255,
        0, -1,  0, 0, 255,
        0,  0, -1, 0, 255,
        0,  0,  0, 1,   0,
      ]),
      child: SvgPicture.asset(
        "assets/icons/company-logo.svg",
        semanticsLabel: "Yexider Logo",
        width: 75.0,
        height: 75.0,
      ),
    );
  }
}