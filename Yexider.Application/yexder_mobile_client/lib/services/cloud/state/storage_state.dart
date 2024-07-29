import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/interceptors/main_interceptor.dart';
import 'package:yexder_mobile_client/global/models/storage/collection.dart';
import 'package:yexder_mobile_client/global/models/storage/file.dart';
import 'package:yexder_mobile_client/global/models/system/variables.dart';

part 'storage_state.g.dart';

class StorageState = StorageStateBase with _$StorageState;

abstract class StorageStateBase with Store {
  @observable
  ObservableMap<String, ObservableList<CollectionModel>> collections = ObservableMap<String, ObservableList<CollectionModel>>();

  @observable
  ObservableMap<String, ObservableList<FileModel>> files = ObservableMap<String, ObservableList<FileModel>>();

  @observable
  ObservableMap<String, ObservableList<CollectionModel>> paths = ObservableMap<String, ObservableList<CollectionModel>>();

  @observable
  String currentFolderId = GlobalVariables.guidEmthy;

  @observable
  String prevFolderId = GlobalVariables.guidEmthy;

  @observable
  bool isLoading = false;

  String adaptId(String? id) {
    return id ?? GlobalVariables.guidEmthy;
  }

  @action
  void setCurrentFolderId(String id) {
    currentFolderId = id;
  }

  @action
  void setPrevFolderId(String id) {
    prevFolderId = id;
  }

  @action
  void setLoadingState(bool state) {
    isLoading = state;
  }

  @action
  Future<void> fetchFolder(String? id) async {
    isLoading = true;
    final response = await httpClient.get("/storage?id=${adaptId(id)}");

    if (response.isSuccess) {
      List<dynamic> result = jsonDecode(response.getValue()?.body ?? "{}");

      if (result.isEmpty || result.length < 3) {
        return;
      }

      prevFolderId = currentFolderId;
      currentFolderId = id ?? GlobalVariables.guidEmthy;

      if (result[0] is List<dynamic>) {
        collections[adaptId(currentFolderId)] = ObservableList<CollectionModel>();

        for (Map<String, dynamic> collection in result[0]) {
          collections[adaptId(currentFolderId)]?.add(CollectionModel.fromMap(collection));
        }
      }

      if (result[1] is List<dynamic>) {
        files[adaptId(currentFolderId)] = ObservableList<FileModel>();

        for (Map<String, dynamic> file in result[1]) {
          files[adaptId(currentFolderId)]?.add(FileModel.fromMap(file));
        }
      }

      if (result[2] is List<dynamic>) {
        paths[adaptId(currentFolderId)] = ObservableList<CollectionModel>();

        for (Map<String, dynamic> path in result[2]) {
          paths[adaptId(currentFolderId)]?.add(CollectionModel.fromMap(path));
        }
      }

      isLoading = false;
    }
  }

  @action 
  void setParentFolderAsCurrent() {
    ObservableList<CollectionModel> collections = paths[currentFolderId] ?? ObservableList();
    int index = collections.length;

    if (index >= 2) {
      index -= 2;
      fetchFolder(collections[index].id);
    } else {
      fetchFolder(GlobalVariables.guidEmthy);
    }
  }
}

StorageState storageState = StorageState();