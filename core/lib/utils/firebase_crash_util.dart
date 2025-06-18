import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashUtil {
  static final FirebaseCrashUtil instance = FirebaseCrashUtil._();

  FirebaseCrashUtil._();

  factory FirebaseCrashUtil() => instance;

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  void recordError(Object e, StackTrace s) async {
    await _crashlytics.recordError(e, s);
  }
}
