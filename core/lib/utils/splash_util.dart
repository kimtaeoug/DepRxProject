import 'package:flutter/services.dart';

class SplashUtil {
  static Future<void> exitSplash() async {
    MethodChannel methodChannel = const MethodChannel('splash_handler');
    await methodChannel.invokeMethod('exit');
  }

  static void preWord() async {
    try {
      await Future.delayed(Duration.zero).then((_) async {
        await exitSplash();
        // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        //     overlays: SystemUiOverlay.values);
      });
    } catch (e) {
      return;
    }
  }
}
