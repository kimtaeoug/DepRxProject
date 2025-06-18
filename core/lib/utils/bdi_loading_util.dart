import 'package:flutter/cupertino.dart';

///
/// BDI Loading Util
///
class BDIUtil {
  static final BDIUtil _instance = BDIUtil._();

  BDIUtil._();

  factory BDIUtil() => _instance;

  ValueNotifier<bool> bdiComplete = ValueNotifier(false);
  ValueNotifier<bool> currentBDILoadingPage = ValueNotifier(false);

  void setBDIComplete(bool input) {
    bdiComplete.value = input;
  }

  void setCurrentBDILoadingPage(bool input) {
    currentBDILoadingPage.value = input;
  }
}
