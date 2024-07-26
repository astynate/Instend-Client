import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/storage/collection.dart';
import 'package:yexder_mobile_client/global/models/storage/file.dart';

part 'storage_state.g.dart';

class StorageState = StorageStateBase with _$StorageState;

abstract class StorageStateBase with Store {
  @observable
  ObservableMap<String, ObservableList<CollectionModel>> collections = ObservableMap<String, ObservableList<CollectionModel>>();

  @observable
  ObservableMap<String, ObservableList<FileModel>> files = ObservableMap<String, ObservableList<FileModel>>();

  @observable
  ObservableMap<String, ObservableList<String>> path = ObservableMap<String, ObservableList<String>>();

  String adaptId(String? id) {
    return id ?? "00000000-0000-0000-0000-000000000000";
  }

  @action
  Future<void> fetchFolder(String? id) async {
    final response = await httpClient.get("/storage?id=${adaptId(id)}");

    if (response.isSuccess) {
      List<dynamic> result = jsonDecode(response.getValue()?.body ?? "{}");

      if (result.isEmpty || result.length < 3) {
        return;
      }

      if (result[0] is List<dynamic>) {
        collections[adaptId(id)] = ObservableList<CollectionModel>();

        for (Map<String, dynamic> collection in result[0]) {
          collections[adaptId(id)]?.add(CollectionModel.fromMap(collection));
        }
      }

      if (result[1] is List<dynamic>) {
        files[adaptId(id)] = ObservableList<FileModel>();

        for (Map<String, dynamic> file in result[1]) {
          files[adaptId(id)]?.add(FileModel.fromMap(file));
        }
      }

      if (result[2] is List<dynamic>) {
        path[adaptId(id)] = ObservableList<String>();

        for (String folderId in result[2]) {
          path[adaptId(id)]?.add(folderId);
        }
      }
    }
  }
}

StorageState storageState = StorageState();