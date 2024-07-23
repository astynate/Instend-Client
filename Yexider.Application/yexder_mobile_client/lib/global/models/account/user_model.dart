import 'package:yexder_mobile_client/global/database/database_model_interface.dart';

class UserModel implements IDatabaseModel {
  @override
  String? id;
  
  String? name;
  String? surname;
  String? nickname;
  String? email;
  double? balance;
  int? friendCount;
  String? avatar;
  String? header;
  double? occupiedSpace;
  double? storageSpace;
  String? description;

  String? systemAccessToken;
  String? systemRefreshToken;

  bool isCurrentAccount = true;

  UserModel.empthy();

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    surname = map['surname'];
    nickname = map['nickname'];
    email = map['email'];
    balance = map['balance']?.toDouble();
    friendCount = map['friendCount'];
    avatar = map['avatar'];
    header = map['header'];
    occupiedSpace = map['occupiedSpace']?.toDouble();
    storageSpace = map['storageSpace']?.toDouble();
    description = map['description'];
    systemAccessToken = map['systemAccessToken'];
    systemRefreshToken = map['systemRefreshToken'];
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'nickname': nickname,
    'email': email,
    'balance': balance,
    'occupiedSpace': occupiedSpace,
    'storageSpace': storageSpace,
    'friendCount': friendCount,
    'avatar': avatar,
    'header': header,
    'systemAccessToken': systemAccessToken,
    'systemRefreshToken': systemRefreshToken
  };
  
  @override
  String createTable() {
    return 
      '''
        CREATE TABLE $tableName (
          id VARCHAR(36) PRIMARY KEY,
          name VARCHAR(200),
          surname VARCHAR(200),
          nickname VARCHAR(200),
          email VARCHAR(200),
          balance DOUBLE,
          friendCount INT,
          avatar TEXT,
          header TEXT,
          occupiedSpace DOUBLE,
          storageSpace DOUBLE,
          description TEXT,
          systemAccessToken VARCHAR(200),
          systemRefreshToken VARCHAR(200)
        )
      ''';
  }

  @override
  String tableName = "user_model";
}