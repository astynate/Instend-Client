// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApplicationState on ApplicationServiceState, Store {
  late final _$currentIndexAtom =
      Atom(name: 'ApplicationServiceState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isBottomPanelOpenAtom =
      Atom(name: 'ApplicationServiceState.isBottomPanelOpen', context: context);

  @override
  bool get isBottomPanelOpen {
    _$isBottomPanelOpenAtom.reportRead();
    return super.isBottomPanelOpen;
  }

  @override
  set isBottomPanelOpen(bool value) {
    _$isBottomPanelOpenAtom.reportWrite(value, super.isBottomPanelOpen, () {
      super.isBottomPanelOpen = value;
    });
  }

  late final _$ApplicationServiceStateActionController =
      ActionController(name: 'ApplicationServiceState', context: context);

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$ApplicationServiceStateActionController.startAction(
        name: 'ApplicationServiceState.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$ApplicationServiceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBottomPanelState(bool state) {
    final _$actionInfo = _$ApplicationServiceStateActionController.startAction(
        name: 'ApplicationServiceState.setBottomPanelState');
    try {
      return super.setBottomPanelState(state);
    } finally {
      _$ApplicationServiceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isBottomPanelOpen: ${isBottomPanelOpen}
    ''';
  }
}
