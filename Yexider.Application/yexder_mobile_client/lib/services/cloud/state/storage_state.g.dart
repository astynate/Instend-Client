// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StorageState on StorageStateBase, Store {
  late final _$collectionsAtom =
      Atom(name: 'StorageStateBase.collections', context: context);

  @override
  ObservableMap<String, ObservableList<CollectionModel>> get collections {
    _$collectionsAtom.reportRead();
    return super.collections;
  }

  @override
  set collections(
      ObservableMap<String, ObservableList<CollectionModel>> value) {
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

  late final _$pathsAtom =
      Atom(name: 'StorageStateBase.paths', context: context);

  @override
  ObservableMap<String, ObservableList<CollectionModel>> get paths {
    _$pathsAtom.reportRead();
    return super.paths;
  }

  @override
  set paths(ObservableMap<String, ObservableList<CollectionModel>> value) {
    _$pathsAtom.reportWrite(value, super.paths, () {
      super.paths = value;
    });
  }

  late final _$currentFolderIdAtom =
      Atom(name: 'StorageStateBase.currentFolderId', context: context);

  @override
  String get currentFolderId {
    _$currentFolderIdAtom.reportRead();
    return super.currentFolderId;
  }

  @override
  set currentFolderId(String value) {
    _$currentFolderIdAtom.reportWrite(value, super.currentFolderId, () {
      super.currentFolderId = value;
    });
  }

  late final _$prevFolderIdAtom =
      Atom(name: 'StorageStateBase.prevFolderId', context: context);

  @override
  String get prevFolderId {
    _$prevFolderIdAtom.reportRead();
    return super.prevFolderId;
  }

  @override
  set prevFolderId(String value) {
    _$prevFolderIdAtom.reportWrite(value, super.prevFolderId, () {
      super.prevFolderId = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'StorageStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchFolderAsyncAction =
      AsyncAction('StorageStateBase.fetchFolder', context: context);

  @override
  Future<void> fetchFolder(String? id) {
    return _$fetchFolderAsyncAction.run(() => super.fetchFolder(id));
  }

  late final _$StorageStateBaseActionController =
      ActionController(name: 'StorageStateBase', context: context);

  @override
  void setCurrentFolderId(String id) {
    final _$actionInfo = _$StorageStateBaseActionController.startAction(
        name: 'StorageStateBase.setCurrentFolderId');
    try {
      return super.setCurrentFolderId(id);
    } finally {
      _$StorageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrevFolderId(String id) {
    final _$actionInfo = _$StorageStateBaseActionController.startAction(
        name: 'StorageStateBase.setPrevFolderId');
    try {
      return super.setPrevFolderId(id);
    } finally {
      _$StorageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingState(bool state) {
    final _$actionInfo = _$StorageStateBaseActionController.startAction(
        name: 'StorageStateBase.setLoadingState');
    try {
      return super.setLoadingState(state);
    } finally {
      _$StorageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParentFolderAsCurrent() {
    final _$actionInfo = _$StorageStateBaseActionController.startAction(
        name: 'StorageStateBase.setParentFolderAsCurrent');
    try {
      return super.setParentFolderAsCurrent();
    } finally {
      _$StorageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
      collections: ${collections},
      files: ${files},
      paths: ${paths},
      currentFolderId: ${currentFolderId},
      prevFolderId: ${prevFolderId},
      isLoading: ${isLoading}
    ''';
  }
}
