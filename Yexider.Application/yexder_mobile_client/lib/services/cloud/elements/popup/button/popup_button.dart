import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupButton extends StatelessWidget {
  final String text;
  final void Function() function;
  late bool isPrimary = false;
  late bool isLoading = false;

  PopupButton({
    super.key, 
    required this.text, 
    required this.function,
    this.isPrimary = false,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              isPrimary ? Theme.of(context).colorScheme.onPrimary : 
                Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          child: 
            isLoading == false ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: isPrimary ? Theme.of(context).colorScheme.surface : 
                      Theme.of(context).colorScheme.onPrimary
                  ),
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: CupertinoActivityIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
        ),
      ),
    );
  }
}
