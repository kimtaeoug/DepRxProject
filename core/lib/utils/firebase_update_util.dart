import 'package:core/core.dart';
import 'package:flutter/services.dart';

class FirebaseUpdateUtil {
  final String _channelName = 'firebase_check';

  Future<bool> checkForNewRelease() async {
    try {
      return await MethodChannel(_channelName).invokeMethod('check');
    } catch (e) {
      Log.e(e);
      return false;
    }
  }
}
