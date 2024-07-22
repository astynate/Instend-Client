import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/cloud/elements/popup/button/popup_button.dart';

class SettingsLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function() discard;
  final void Function() save;
  late bool isLoading = false;
  
  SettingsLayout({
    super.key, 
    required this.title, 
    required this.body,
    required this.discard,
    required this.save,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: body
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Row(
            children: [
              // PopupButton(
              //   text: "Discard", 
              //   function: discard
              // ),
              PopupButton(
                isPrimary: true,
                text: "Save",
                function: save,
                isLoading: isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}