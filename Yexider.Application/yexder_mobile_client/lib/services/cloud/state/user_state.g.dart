// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserState on UserStateBase, Store {
  late final _$userAtom = Atom(name: 'UserStateBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$friendsAtom =
      Atom(name: 'UserStateBase.friends', context: context);

  @override
  List<FriendModel>? get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(List<FriendModel>? value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  late final _$communitiesAtom =
      Atom(name: 'UserStateBase.communities', context: context);

  @override
  List<String>? get communities {
    _$communitiesAtom.reportRead();
    return super.communities;
  }

  @override
  set communities(List<String>? value) {
    _$communitiesAtom.reportWrite(value, super.communities, () {
      super.communities = value;
    });
  }

  late final _$UserStateBaseActionController =
      ActionController(name: 'UserStateBase', context: context);

  @override
  void setUser(UserModel userValue) {
    final _$actionInfo = _$UserStateBaseActionController.startAction(
        name: 'UserStateBase.setUser');
    try {
      return super.setUser(userValue);
    } finally {
      _$UserStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFriends(List<FriendModel> friendsValue) {
    final _$actionInfo = _$UserStateBaseActionController.startAction(
        name: 'UserStateBase.setFriends');
    try {
      return super.setFriends(friendsValue);
    } finally {
      _$UserStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCommunities(List<String> communitiesValue) {
    final _$actionInfo = _$UserStateBaseActionController.startAction(
        name: 'UserStateBase.setCommunities');
    try {
      return super.setCommunities(communitiesValue);
    } finally {
      _$UserStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
friends: ${friends},
communities: ${communities}
    ''';
  }
}
