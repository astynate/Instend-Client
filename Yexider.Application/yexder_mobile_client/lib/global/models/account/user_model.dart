class UserModel {
  String? id;
  String? name;
  String? surname;
  String? nickname;
  String? email;
  double? balance;
  int? friendCount;
  String? avatar;
  String? header;
  double? storageSpace;
  String? description;

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
    storageSpace = map['storageSpace']?.toDouble();
    description = map['description'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'nickname': nickname,
    'email': email,
    'balance': balance,
    'countFriends': friendCount,
    'avatar': avatar,
    'header': header,
  };
}