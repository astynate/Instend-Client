import 'package:yexder_mobile_client/global/models/system/result.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';

class UserModel {
  late String _name;
  late String _surname;
  late String _nickname;
  late String _email;
  late double _balance;
  late int _countFriends;
  late String _avatar;
  late String _header;

  UserModel  
  (
    String name, 
    String surname, 
    String nickname, 
    String email,
    double balance,
    int countFriends,
    String avatar,
    String header
  ) 
  {
    _name = name;
    _surname = surname;
    _nickname = nickname;
    _balance = balance;
    _email = email;
    _countFriends = countFriends;
    _avatar = avatar;
    _header = header;
  }

  static Result<UserModel> create
  (
    String name,
    String surname, 
    String nickname, 
    String email,
    double balance,
    int countFriends,
    String avatar,
    String header
  ) 
  {
    if (ValidateHandler.validateString(name, 20) == false) {
      return Result<UserModel>().failure("Invalid name");
    }

    if (ValidateHandler.validateString(surname, 20) == false) {
      return Result<UserModel>().failure("Invalid surname");
    }

    if (ValidateHandler.validateString(nickname, 20) == false) {
      return Result<UserModel>().failure("Invalid nickname");
    }

    if (balance < 0) {
      return Result<UserModel>().failure("Invalid balance");
    }
    
    return Result<UserModel>().success(UserModel
    (
      name, 
      surname, 
      nickname, 
      email,
      balance, 
      countFriends, 
      avatar, 
      header
    ));
  }

  Map<String, dynamic> toJson() => {
    'name': _name,
    'surname': _surname,
    'nickname': _nickname,
    'email': _email,
    'balance': _balance,
    'countFriends': _countFriends,
    'avatar': _avatar,
    'header': _header,
  };
}