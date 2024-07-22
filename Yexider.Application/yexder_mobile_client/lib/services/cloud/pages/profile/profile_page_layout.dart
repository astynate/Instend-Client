import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/main_header/main_header.dart';

class ProfilePageLayout extends StatelessWidget {
  const ProfilePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: applicationState.isHeaderOpen ? AppBar().preferredSize :  const Size(0, 0),
            child: const YexiderHeader(title: "Profile")
          ),
          body: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40.0))),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: List.generate(30, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Container(
                        color: const Color.fromARGB(255, 27, 27, 27),
                        height: 200,
                        child: Center(
                          child: Text('Item ${index + 1}'),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}