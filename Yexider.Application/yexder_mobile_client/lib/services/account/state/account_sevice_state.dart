import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';

part 'account_sevice_state.g.dart';

class AccountServiceState = AccountServiceStateBase with _$AccountServiceState;

abstract class AccountServiceStateBase with Store {
  RegExp guidRegexExpression = RegExp(r'[({]?[a-fA-F0-9]{8}[-]?([a-fA-F0-9]{4}[-]?){3}[a-fA-F0-9]{12}[})]?');
  
  @observable
  UserTranferModel newUser = UserTranferModel();

  @observable
  String? confirmationLink;

  @observable
  String? confirmationCode;

  @action
  void changeName(String value) => newUser.name = value;

  @action
  void changeSurname(String value) => newUser.surname = value;

  @action
  void changeNickname(String value) => newUser.nickname = value;

  @action
  void changePassword(String value) => newUser.password = value;

  @action
  void changeConfirmPassword(String value) => newUser.confirmPassword = value;

  @action
  void changeEmail(String value) => newUser.email = value;

  @action
  void setConfimationCode(String value) => confirmationCode = value;

  @action
  void setConfimationLink(String value) {
    if (accountServiceState.guidRegexExpression.hasMatch(value) == true) {
      confirmationLink = value;
    }
  }
}

AccountServiceState accountServiceState = AccountServiceState();