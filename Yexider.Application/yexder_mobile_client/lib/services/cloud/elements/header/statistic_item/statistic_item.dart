import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final String amount;

  const StatisticItem({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color.fromARGB(255, 54, 54, 54)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0),
          child: Column(
            children: [
              Text(
                title, 
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}