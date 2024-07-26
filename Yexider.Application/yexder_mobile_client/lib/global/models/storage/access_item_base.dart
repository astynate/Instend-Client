import 'package:mobx/mobx.dart';

enum AccessTypes {
  private,
  favorites,
  public,
}

class AccessItemBase {
  @observable
  String? ownerId;

  @observable
  AccessTypes access = AccessTypes.private;

  String createDatabaseColumns() {
    return 
      '''
        ownerId TEXT,
        access TEXT CHECK (access IN ('Private', 'Public', 'Favorites'))
      ''';
  }
}