import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/utils/toast_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
/// NetworkObserver
///
class NetworkObserverUtil {
  static final NetworkObserverUtil _instance = NetworkObserverUtil._();

  NetworkObserverUtil._();

  factory NetworkObserverUtil() => _instance;

  final ValueNotifier<bool> network = ValueNotifier(true);
  final ValueNotifier<ConnectivityResult> _networkType =
      ValueNotifier(ConnectivityResult.none);

  bool get checkNetwork => network.value;

  String get networkType => _networkType.value.name;

  late StreamSubscription<List<ConnectivityResult>> subscription;

  final Connectivity _connectivity = Connectivity();

  void init(BuildContext context) {
    subscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        network.value = false;
        ToastHandler().show('errorMain_toast_error'.tr, isError: true);
      } else {
        _networkType.value = result.first;
        network.value = true;
      }
    });
  }

  void dispose() {
    subscription.cancel();
  }
}
