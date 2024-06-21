import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:mobx/mobx.dart';
import 'dart:collection';

part 'application_state.g.dart';

class ApplicationState = ApplicationStateBase with _$ApplicationState;

abstract class ApplicationStateBase with Store {
  @observable
  late Queue<YexiderSystemError> errorQueue = Queue<YexiderSystemError>();

  @action
  void addErrorInQueue(String title, String errorMessage, int? levelValue) {
    errorQueue.add(YexiderSystemError(title, errorMessage, levelValue));
  }

  @action
  YexiderSystemError removeErrorFromQueue() {
    return errorQueue.first;
  }
}

ApplicationState applicationState = ApplicationState();