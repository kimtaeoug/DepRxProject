import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/services.dart';

class CloseDetectorHandler {
  late StreamSubscription? streamSubscription;

  void init() {
    Log.e('init is invoked');
    EventChannel eventChannel = EventChannel('close_detector');
    streamSubscription =
        eventChannel.receiveBroadcastStream().listen(_listener);
  }

  void cancel() {
    streamSubscription?.cancel();
    streamSubscription = null;
  }

  void _listener(value) {
    Log.e('statr Listen');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('VAlue : $value');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }
}
