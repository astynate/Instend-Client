import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/global/models/transfer/user_transfer_model.dart';

part 'account_sevice_state.g.dart';

class AccountServiceState = AccountServiceStateBase with _$AccountServiceState;

abstract class AccountServiceStateBase with Store {
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
    if (ValidateHandler.validateGuid(value)) {
      confirmationLink = value;
    }
  }
}

AccountServiceState accountServiceState = AccountServiceState();