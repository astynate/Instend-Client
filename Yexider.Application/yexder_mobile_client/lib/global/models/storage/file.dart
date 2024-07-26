import 'dart:convert';
import 'dart:typed_data';
import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/database/database_model_interface.dart';
import 'package:yexder_mobile_client/global/models/storage/access_item_base.dart';

class FileModel extends AccessItemBase implements IDatabaseModel {
  @override @observable String? id;
  
  @observable String? name;
  @observable DateTime? creationTime;
  @observable DateTime? lastEditTime;
  @observable String? path;
  @observable String? type;
  @observable String? folderId;
  @observable int? size;
  @observable Uint8List? preview;
  @observable Uint8List? fileAsBytes;

  @override
  String tableName = "files";

  @override
  String createTable() {
    return 
      '''
        CREATE TABLE $tableName (
          id VARCHAR(36),
          creationTime DATETIME,
          lastEditTime DATETIME,
          path VARCHAR(200),
          type VARCHAR(200),
          folderId VARCHAR(36),
          size DOUBLE,
          preview BLOB,
          fileAsBytes BLOB,
        )
      ''';
  }

  FileModel.empthy();

  FileModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> file = {};
    Map<String, dynamic> meta = {};

    if (map['file'] != null) {
      file = map['file'];
    }

    if (map['meta'] != null) {
      meta = map['meta'];
    }

    id = file['id'];
    name = file['name'];
    path = file['path'];
    type = file['type'];
    folderId = file['folderId'];
    size = file['size']?.toInt();
    preview = file['preview'];

    if (file['fileAsBytes'] != null && file['fileAsBytes'] != "") {
      fileAsBytes = base64Decode(file['fileAsBytes'] ?? '');
    }

    if (file['creationTime'] != null) {
      creationTime = DateTime.parse(file['creationTime']);
    }

    if (file['lastEditTime'] != null) {
      lastEditTime = DateTime.parse(file['lastEditTime']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationTime': creationTime,
      'lastEditTime': lastEditTime,
      'path': path,
      'type': type,
      'folderId': folderId,
      'size': size,
      'preview': preview,
      'fileAsBytes': fileAsBytes
    };
  }
}