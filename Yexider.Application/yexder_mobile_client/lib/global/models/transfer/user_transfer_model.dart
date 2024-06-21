class UserTranferModel {
  String? name;
  String? surname;
  String? email;
  String? nickname;
  String? password;
  String? confirmPassword;

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'nickname': nickname,
    'email': email,
    'password': password,
  };
}