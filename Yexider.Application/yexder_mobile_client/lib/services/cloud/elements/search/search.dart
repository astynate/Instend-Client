import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  String text; 

  Search({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 0.0, right: 5.0),
          hintText: text,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 18.0, fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 15.0, bottom: 15),
            child: SvgPicture.asset(
              "assets/main/global/search.svg",
              height: 16,
              width: 16,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}