import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final String amount;

  const StatisticItem({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(21.0)),
            color: Theme.of(context).colorScheme.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                  ),
                ),
                const SizedBox(height: 0),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}