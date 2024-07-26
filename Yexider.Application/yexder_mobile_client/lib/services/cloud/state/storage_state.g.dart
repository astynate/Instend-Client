// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

mixin _$StorageState on StorageStateBase, Store {
  late final _$collectionsAtom =
      Atom(name: 'StorageStateBase.collections', context: context);

  @override
  ObservableMap<String, ObservableList<CollectionModel>> get collections {
    _$collectionsAtom.reportRead();
    return super.collections;
  }

  @override
  set collections(ObservableMap<String, ObservableList<CollectionModel>> value) {
    _$collectionsAtom.reportWrite(value, super.collections, () {
      super.collections = value;
    });
  }

  late final _$filesAtom =
      Atom(name: 'StorageStateBase.files', context: context);

  @override
  ObservableMap<String, ObservableList<FileModel>> get files {
    _$filesAtom.reportRead();
    return super.files;
  }

  @override
  set files(ObservableMap<String, ObservableList<FileModel>> value) {
    _$filesAtom.reportWrite(value, super.files, () {
      super.files = value;
    });
  }

  @override
  String toString() {
    return '''
      collections: $collections,
      files: $files
    ''';
  }
}
