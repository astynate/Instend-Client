import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/pages/profile/profile_header.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/main_header/main_header.dart';

class ProfilePageLayout extends StatelessWidget {
  const ProfilePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Communities', 'Music', 'Photos'];

    return Observer(
      builder: (context) {
        return DefaultTabController(
          initialIndex: 0,
          length: tabs.length,
          child: Scaffold(
              appBar: PreferredSize(
              preferredSize: applicationState.isHeaderOpen ? AppBar().preferredSize :  const Size(0, 0),
              child: const YexiderHeader(title: "Profile")
            ),
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle:
                        NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                      floating: true,
                      surfaceTintColor: Theme.of(context).colorScheme.surface,
                      automaticallyImplyLeading: false,
                      titleSpacing: 0,
                      flexibleSpace: const ProfileHeader(),
                      pinned: true,
                      expandedHeight: 250.0,
                      forceElevated: innerBoxIsScrolled,
                      // snap: true,
                      // stretch: true,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.surface,
                      bottom: PreferredSize(
                        preferredSize: Size(MediaQuery.of(context).size.width, 48),
                        child: Container(
                          color: Theme.of(context).colorScheme.surface,
                          child: TabBar(
                            isScrollable: true,
                            padding: EdgeInsets.zero,
                            tabAlignment: TabAlignment.start,
                            dividerColor: Theme.of(context).colorScheme.secondary,
                            overlayColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
                            tabs: tabs.map((String name) => Tab(text: name)).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: tabs.map((String name) {
                  return SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      builder: (BuildContext context) {
                        return CustomScrollView(
                          key: PageStorageKey<String>(name),
                          slivers: <Widget>[
                            SliverOverlapInjector(
                              handle:
                                  NestedScrollView.sliverOverlapAbsorberHandleFor(
                                      context),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              sliver: SliverFixedExtentList(
                                itemExtent: 48.0,
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text('Item $index'),
                                    );
                                  },
                                  childCount: 30,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      }
    );
  }
}