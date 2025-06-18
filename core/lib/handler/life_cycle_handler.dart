import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

///
/// AppLifeCycle Handler
///
class LifeCycleHandler {
  static final LifeCycleHandler instance = LifeCycleHandler._();

  LifeCycleHandler._();

  factory LifeCycleHandler() => instance;

  final TimeDetectorUtil _timeDetectorUtil = TimeDetectorUtil();

  void process(AppLifecycleState state, {bool isSham = false}) async {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        // _timeDetectorUtil.process();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }
}
