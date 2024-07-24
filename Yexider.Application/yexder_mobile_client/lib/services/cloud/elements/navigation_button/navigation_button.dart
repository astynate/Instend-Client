import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YexiderNavigationButton extends StatelessWidget {
  final String defaultIcon;
  final String selectedIcon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  const YexiderNavigationButton({
    super.key,
    required this.defaultIcon,
    required this.selectedIcon,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0)),
        ),
        onPressed: () {
          onPressed(index);
        },
        child: SizedBox(
          height: 50,
          child: ColorFiltered(
            colorFilter: const ColorFilter.matrix(<double>[
              -1, 0, 0, 0, 255,
              0, -1, 0, 0, 255,
              0, 0, -1, 0, 255,
              0, 0, 0, 1, 0,
            ]),
            child: SvgPicture.asset(
              index == currentIndex ? selectedIcon : defaultIcon,
              semanticsLabel: "None",
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}