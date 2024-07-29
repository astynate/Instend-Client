import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/database/database_model_interface.dart';
import 'package:yexder_mobile_client/global/models/storage/File.dart';
import 'package:yexder_mobile_client/global/models/storage/access_item_base.dart';

enum FolderType {
  ordinary,
  system,
  secret
} 

class CollectionModel extends AccessItemBase implements IDatabaseModel {
  @override 
  @observable 
  String? id;

  @observable String? name;
  @observable DateTime? creationTime;
  @observable String? folderId;
  @observable List<FileModel>? preview;
  @observable FolderType? folderType;
  @observable bool visibility = true;
  
  @override 
  String tableName = "collections";

  @override
  String createTable() {
    return 
      '''
        CREATE TABLE IF NOT EXISTS $tableName (
          id TEXT PRIMARY KEY,
          creationTime DATETIME,
          folderId TEXT,
          visibility INTEGER,
          ${createDatabaseColumns()}
        );
      ''';
  }

  @override
  CollectionModel.empthy();

  @override
  CollectionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    creationTime = DateTime.parse(map['creationTime']);
    folderId = map['folderId'];
    visibility = map['visibility'];
    folderType = FolderType.values[map['folderType']?.toInt()];
    ownerId = map['ownerId'];
    access = AccessTypes.values[map['access']?.toInt()];

    if (map['preview'] is List<dynamic>) {
      preview = List.empty(growable: true);

      for (Map<String, dynamic> file in map['preview']) {
        preview?.add(FileModel.fromMap(file));
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": creationTime,
      "folderId": folderId,
      "preview": preview,
      "visibility": visibility,
      "typeId": preview,
      // "visibility": visibility
    };
  }
}