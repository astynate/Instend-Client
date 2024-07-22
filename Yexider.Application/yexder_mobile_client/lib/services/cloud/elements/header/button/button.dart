import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingButton extends StatefulWidget {
  final String text;
  final String description;
  final String icon;
  final void Function() function;

  const SettingButton({
    super.key, 
    required this.text, 
    required this.description,
    required this.icon, 
    required this.function
  });

  @override
  State<SettingButton> createState() => _SettingButtonState(this.icon, this.function);
}

class _SettingButtonState extends State<SettingButton> {
  final String icon;
  final void Function() function;

  _SettingButtonState(this.icon, this.function);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), 
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 2.0),
            ),
          ),
          onPressed: function,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    semanticsLabel: "None",
                    width: 21.0,
                    height: 21.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/main/global/next.svg",
                    semanticsLabel: "None",
                    width: 16.0,
                    height: 16.0,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            widget.description,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
