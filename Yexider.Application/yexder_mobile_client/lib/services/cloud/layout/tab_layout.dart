import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/main_header/main_header.dart';

class TabLayout extends StatelessWidget {
  final String title;
  final List<String> tabs;
  final List<Widget> widgets;
  final double expandedHeight;
  final Widget floatingWidget;
  final Widget? header;
  late double headerSize;

  TabLayout({
    super.key, 
    required this.title, 
    required this.tabs, 
    required this.widgets, 
    required this.expandedHeight, 
    required this.floatingWidget, 
    this.header,
    this.headerSize = 48
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return DefaultTabController(
          initialIndex: 0,
          length: tabs.length,
          child: Scaffold(
              appBar: PreferredSize(
              preferredSize: applicationState.isHeaderOpen ? AppBar().preferredSize :  const Size(0, 0),
              child: YexiderHeader(title: title)
            ),
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
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
                      flexibleSpace: floatingWidget,
                      pinned: true,
                      expandedHeight: expandedHeight,
                      forceElevated: innerBoxIsScrolled,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.surface,
                      bottom: PreferredSize(
                        preferredSize: Size(MediaQuery.of(context).size.width, headerSize),
                        child: Container(
                          color: Theme.of(context).colorScheme.surface,
                          child: Column(
                            children: [
                              TabBar(
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
                              if (header != null) header ?? const Text("")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.only(top: headerSize),
                child: TabBarView(
                  children: widgets
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {

              },
              child: const Icon(Icons.add, size: 32,),
            ),
          ),
        );
      }
    );
  }
}