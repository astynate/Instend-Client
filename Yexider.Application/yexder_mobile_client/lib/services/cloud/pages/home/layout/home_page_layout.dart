import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/storage/collection.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/popup_handler.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/global/models/system/variables.dart';
import 'package:yexder_mobile_client/services/cloud/elements/bottom_panel/bottom_panel_button.dart';
import 'package:yexder_mobile_client/services/cloud/elements/search/search.dart';
import 'package:yexder_mobile_client/services/cloud/layout/tab_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/all.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/collections.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/files.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/messages.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/pages/music.dart';
import 'package:yexder_mobile_client/services/cloud/state/storage_state.dart';

class HomePageLayout extends StatefulWidget {
  HomePageLayout({super.key}) {
    storageState.fetchFolder(null);
  }

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  int queueId = 0;
  String collectionName = "";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) {
        if (didPop == false) {
          storageState.setParentFolderAsCurrent();
        }
      },
      canPop: false,
      child: TabLayout(
        title: 'Home', 
        tabs: const <String>['All', 'Collections', 'Files', 'Music', 'Messages'], 
        widgets: const [
          HomeSubPageAll(),
          HomeSubPageCollections(),
          HomeSubPageFiles(),
          HomeSubPageMusic(),
          HomeSubPageMessages(),
        ], 
        actionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            applicationState.showBottomPanel(
              context, 
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      height: 4,
                      width: 50,
                    )
                  ),
                  Observer(
                    builder: (context) {
                      return BottomPanelButton(
                        title: "Collection", 
                        icon: Icon(CupertinoIcons.folder, color: Theme.of(context).colorScheme.onPrimary,), 
                        function: () {
                          // Navigator.pop(context);
                      
                          PopupHandler.showPopUpField(
                            context, 
                            "New collection", 
                            "Collection name", 
                            () async {
                              if (ValidateHandler.validateString(collectionName, 20)) {
                                Map<String, String> requestBody = {
                                  'name': collectionName,
                                  'folderId': storageState.currentFolderId == GlobalVariables.guidEmthy ? "" : storageState.currentFolderId,
                                  'queueId': queueId.toString()
                                };
                      
                                await httpClient.post(
                                  '/folders', 
                                  object: requestBody,
                                  contentType: YexiderContentTypes.none
                                ); 
                                
                                queueId++;
                                return true;
                              }
                      
                              applicationState.showAttentionMessage(context, "Invalid name!");
                              return false;
                            },
                            (String text) {
                              setState(() {
                                collectionName = text;
                              });
                            }
                          );
                        }
                      );
                    }
                  ),
                  BottomPanelButton(
                    title: "Upload from device", 
                    icon: Icon(CupertinoIcons.cloud_upload, color: Theme.of(context).colorScheme.onPrimary,), 
                    function: () {

                    }
                  ),
                  BottomPanelButton(
                    title: "Upload from gallery", 
                    icon: Icon(Icons.collections, color: Theme.of(context).colorScheme.onPrimary,), 
                    function: () {

                    }
                  )
                ],
              ),
              210
            );
          },
          child: const Icon(Icons.add, size: 32,),
        ),
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
                      Observer(
                        builder: (context) {
                          List<CollectionModel> path = storageState.paths[storageState.currentFolderId] ?? <CollectionModel> [];
                          String folderName = "Main Collection";

                          if (path.isNotEmpty) {
                            folderName = path.last.name ?? "No name";
                          }

                          return TextButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(const EdgeInsets.all(5))
                            ),
                            onPressed: () {
                              storageState.setParentFolderAsCurrent();
                            },
                            child: Row(
                              children: [
                                if (path.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onPrimary),
                                  ),
                                Text(
                                  folderName,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
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
      )
    );
  }
}