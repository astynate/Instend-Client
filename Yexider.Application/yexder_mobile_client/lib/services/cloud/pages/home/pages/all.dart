import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/storage/collection.dart';
import 'package:yexder_mobile_client/global/models/storage/file.dart';
import 'package:yexder_mobile_client/services/cloud/elements/storage/collection_view.dart';
import 'package:yexder_mobile_client/services/cloud/elements/storage/file_view.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/layout/page_template.dart';
import 'package:yexder_mobile_client/services/cloud/state/storage_state.dart';

class HomeSubPageAll extends StatelessWidget {
  const HomeSubPageAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return HomeSubPageTemplate(
          widget: storageState.isLoading == false ? 
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              childAspectRatio: 0.65,
              children: 
                List.from(storageState.collections[storageState.currentFolderId]?.map((CollectionModel model) {
                  return CollectionView(collection: model,);
                }).toList() ?? <Widget>[])
                ..addAll(storageState.files[storageState.currentFolderId]?.map((FileModel model) {
                  return FileView(file: model);
                }).toList() ?? <Widget>[])
            ) 
          : 
            Center(
              child: CupertinoActivityIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
        );
      }
    );
  }
}