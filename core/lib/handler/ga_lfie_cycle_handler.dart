import 'dart:ui';

import 'package:get/get.dart';

///
/// GA Life Cycle Handler
///
class GALifeCycleHandler {
  final AppLifecycleState state;
  final Function(bool exitFromBack) gaFunction;
  final Function()? fcmFunction;

  GALifeCycleHandler(
      {required this.state, required this.gaFunction, this.fcmFunction}) {
    process();
  }

  bool _isFromBack = false;

  void process() {
    switch (state) {
      case AppLifecycleState.detached:
        gaFunction(_isFromBack);
        break;
      case AppLifecycleState.resumed:
        if (fcmFunction != null) {
          fcmFunction?.call();
        }
        _isFromBack = false;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        _isFromBack = true;
        break;
      case AppLifecycleState.paused:
        break;
    }
  }
}
