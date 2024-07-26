import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/services/cloud/elements/search/search.dart';
import 'package:yexder_mobile_client/services/cloud/layout/tab_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/all.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/collections.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/files.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/messages.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/music.dart';
import 'package:yexder_mobile_client/services/cloud/state/storage_state.dart';

class HomePageLayout extends StatelessWidget {
  HomePageLayout({super.key}) {
    storageState.fetchFolder(null);
  }

  @override
  Widget build(BuildContext context) {
    return TabLayout(
      title: 'Home', 
      tabs: const <String>['All', 'Collections', 'Files', 'Music', 'Messages'], 
      widgets: const [
        HomeSubPageAll(),
        HomeSubPageCollections(),
        HomeSubPageFiles(),
        HomeSubPageMusic(),
        HomeSubPageMessages(),
      ], 
      expandedHeight: 155, 
      floatingWidget: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Search(text: "Search", type: SearchTypes.shaded),
      ),
      header: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 14.0, right: 14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Main collection",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    // Text(
                    //   "Count items",
                    //   style: TextStyle(
                    //     color: Theme.of(context).colorScheme.onSecondary,
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400
                    //   ),
                    // )
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
                    padding: WidgetStateProperty.all(EdgeInsets.zero)
                  ),
                  onPressed: () {}, 
                  child: const Icon(Icons.menu, size: 24.0),
                )
              ],
            )
          ],
        ),
      ),
      headerSize: 101,
    );
  }
}