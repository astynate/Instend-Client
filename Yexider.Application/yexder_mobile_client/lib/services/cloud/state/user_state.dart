import 'package:mobx/mobx.dart';
import 'package:yexder_mobile_client/global/models/account/friend_model.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';

part 'user_state.g.dart';

class UserState = UserStateBase with _$UserState;

abstract class UserStateBase with Store {
  @observable
  UserModel? user;

  @observable
  List<FriendModel>? friends;

  @observable
  List<String>? communities;

  @action
  void setUser(UserModel userValue) {
    user = userValue;
  }

  @action
  void setFriends(List<FriendModel> friendsValue) {
    friends = friendsValue;
  }

  @action
  void setCommunities(List<String> communitiesValue) {
    communities = communitiesValue;
  }
}

UserState userState = UserState();