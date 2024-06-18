import 'package:yexder_mobile_client/global/models/system/result.dart';

class UserModel {
  late String _name;
  late String _surname;
  late String _nickname;
  late double _balance;
  late int _countFriends;
  late String _avatar;
  late String _header;

  UserModel();

  static Result<UserModel> Create
  (
    String name, 
    String surname, 
    String nickname, 
    double balance,
    int countFriends,
    String avatar,
    String header
  ) 
  {
    if () {

    }

    return Result<UserModel>(UserModel());
  }
}