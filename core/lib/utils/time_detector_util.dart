import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// Time Detector
///
class TimeDetectorUtil {
  static final TimeDetectorUtil _util = TimeDetectorUtil._();

  TimeDetectorUtil._() {
    _init();
  }

  factory TimeDetectorUtil() => _util;

  StreamSubscription<dynamic>? streamSubscription;
  final ValueNotifier<bool> _doRefresh = ValueNotifier(false);
  final ValueNotifier<Function()?> _refreshFunction = ValueNotifier(null);
  final ValueNotifier<Function()?> _moveFunction = ValueNotifier(null);
  final ValueNotifier<bool> _landingPage = ValueNotifier(false);

  bool get doRefresh => _doRefresh.value;
  bool get landingPage => _landingPage.value;

  void _init() {
    streamSubscription = EventChannel('time_detector')
        .receiveBroadcastStream()
        .listen(_listener);
  }

  void setRefreshMoveFunction(
      {required Function() refreshFunction, required Function() moveFunction}) {
    _refreshFunction.value = refreshFunction;
    _moveFunction.value = moveFunction;
  }

  void setRefreshFunction(Function() input) {
    _refreshFunction.value = input;
  }

  void setMoveFunction(Function() input) {
    _moveFunction.value = input;
  }

  void setLandingPage(bool input){
    _landingPage.value = input;
  }

  //12시가 되면 메인페이지로 던짐
  void _listener(dynamic input) {
    if (input is String) {
      if (input == 'do') {
        _doRefresh.value = true;
        process();
      }
    }
  }

  void cancel() {
    streamSubscription?.cancel();
  }

  final AccessTokenUtil _accessTokenUtil = AccessTokenUtil();

  void process() {
    if (_doRefresh.value) {
      if (_accessTokenUtil.tokenValue != '') {
        _doRefreshFunction();
      } else {
        _doRefresh.value = false;
        Get.offAllNamed(Routes.socialLogin);
      }
    }
  }

  void _doRefreshFunction() {
    if (_doRefresh.value && !_landingPage.value) {
      _refreshFunction.value?.call();
      Get.offAllNamed(Routes.serverUpdatePage, arguments: {
        'function': () {
          _moveFunction.value?.call();
          _doRefresh.value = false;
          setLandingPage(false);
        }
      });
    }
  }
}
