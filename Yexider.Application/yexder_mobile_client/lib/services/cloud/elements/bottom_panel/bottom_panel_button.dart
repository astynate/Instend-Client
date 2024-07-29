import 'package:flutter/material.dart';

class BottomPanelButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function() function;

  const BottomPanelButton({
    super.key, 
    required this.title, 
    required this.icon, 
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          )),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.onTertiary),
            // bottom: BorderSide(color: Theme.of(context).colorScheme.onTertiary)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}