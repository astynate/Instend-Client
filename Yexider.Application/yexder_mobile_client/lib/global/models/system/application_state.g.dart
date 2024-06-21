// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApplicationState on ApplicationStateBase, Store {
  late final _$errorQueueAtom =
      Atom(name: 'ApplicationStateBase.errorQueue', context: context);

  @override
  Queue<YexiderSystemError> get errorQueue {
    _$errorQueueAtom.reportRead();
    return super.errorQueue;
  }

  bool _errorQueueIsInitialized = false;

  @override
  set errorQueue(Queue<YexiderSystemError> value) {
    _$errorQueueAtom.reportWrite(
        value, _errorQueueIsInitialized ? super.errorQueue : null, () {
      super.errorQueue = value;
      _errorQueueIsInitialized = true;
    });
  }

  late final _$ApplicationStateBaseActionController =
      ActionController(name: 'ApplicationStateBase', context: context);

  @override
  void addErrorInQueue(String title, String errorMessage, int? levelValue) {
    final _$actionInfo = _$ApplicationStateBaseActionController.startAction(
        name: 'ApplicationStateBase.addErrorInQueue');
    try {
      return super.addErrorInQueue(title, errorMessage, levelValue);
    } finally {
      _$ApplicationStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  YexiderSystemError removeErrorFromQueue() {
    final _$actionInfo = _$ApplicationStateBaseActionController.startAction(
        name: 'ApplicationStateBase.removeErrorFromQueue');
    try {
      return super.removeErrorFromQueue();
    } finally {
      _$ApplicationStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorQueue: ${errorQueue}
    ''';
  }
}
