// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_sevice_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountServiceState on AccountServiceStateBase, Store {
  late final _$newUserAtom =
      Atom(name: 'AccountServiceStateBase.newUser', context: context);

  @override
  UserTranferModel get newUser {
    _$newUserAtom.reportRead();
    return super.newUser;
  }

  @override
  set newUser(UserTranferModel value) {
    _$newUserAtom.reportWrite(value, super.newUser, () {
      super.newUser = value;
    });
  }

  late final _$confirmationLinkAtom =
      Atom(name: 'AccountServiceStateBase.confirmationLink', context: context);

  @override
  String? get confirmationLink {
    _$confirmationLinkAtom.reportRead();
    return super.confirmationLink;
  }

  @override
  set confirmationLink(String? value) {
    _$confirmationLinkAtom.reportWrite(value, super.confirmationLink, () {
      super.confirmationLink = value;
    });
  }

  late final _$confirmationCodeAtom =
      Atom(name: 'AccountServiceStateBase.confirmationCode', context: context);

  @override
  String? get confirmationCode {
    _$confirmationCodeAtom.reportRead();
    return super.confirmationCode;
  }

  @override
  set confirmationCode(String? value) {
    _$confirmationCodeAtom.reportWrite(value, super.confirmationCode, () {
      super.confirmationCode = value;
    });
  }

  late final _$AccountServiceStateBaseActionController =
      ActionController(name: 'AccountServiceStateBase', context: context);

  @override
  void changeName(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSurname(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changeSurname');
    try {
      return super.changeSurname(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNickname(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changeNickname');
    try {
      return super.changeNickname(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfimationCode(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.setConfimationCode');
    try {
      return super.setConfimationCode(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfimationLink(String value) {
    final _$actionInfo = _$AccountServiceStateBaseActionController.startAction(
        name: 'AccountServiceStateBase.setConfimationLink');
    try {
      return super.setConfimationLink(value);
    } finally {
      _$AccountServiceStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newUser: ${newUser},
confirmationLink: ${confirmationLink},
confirmationCode: ${confirmationCode}
    ''';
  }
}
