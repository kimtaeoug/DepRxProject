import 'package:common/component/common/dp_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';

///
/// Permisison Util
///
class PermissionUtil {
  static final PermissionUtil _instance = PermissionUtil._();

  PermissionUtil._();

  factory PermissionUtil() => _instance;

  final ValueNotifier<bool> notiPermisisonNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _checkIsFromSetting = ValueNotifier(false);

  bool get checkIsFromSetting => _checkIsFromSetting.value;

  FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

  void setCheckIsFromSetting(bool input) {
    _checkIsFromSetting.value = input;
  }

  Future<bool> checkNotiPermission() async {
    String rawGranted = await hasNotificationPermission();
    if (rawGranted == "granted") {
      notiPermisisonNotifier.value = true;
      return true;
    } else {
      notiPermisisonNotifier.value = false;
      return false;
    }
  }

  void requestNotiPermission({required Function() successFunction,
    required Function() failFunction}) async {
    await plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission()
        .then((value) {
      if (value == true) {
        notiPermisisonNotifier.value = true;
        successFunction();
      } else {
        notiPermisisonNotifier.value = false;
        failFunction();
      }
    });
  }

  final DPDialog dpDialog = DPDialog();

  Future<bool?> requestNotificationPermission() async {
    return await plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  void handlingNotiPermission(
      {required Function() successFunction, bool isSplash = false}) async {
    await requestNotificationPermission().then((value) async {
      if (value == true) {
        successFunction();
      } else {
        String status = await hasNotificationPermission();
        if (isSplash) {
          SplashUtil.preWord();
        }
        dpDialog.notiPermission(() async {
          if (status != "permanent") {
            Get.back();
            handlingNotiPermission(
                successFunction: successFunction, isSplash: isSplash);
          } else {
            Get.back();
            openNotificationSetting();
          }
        });
      }
    });
  }

  late final MethodChannel _methodChannel =
  MethodChannel('notification_permission');

  Future<String> hasNotificationPermission() async {
    return await _methodChannel.invokeMethod('check');
  }

  void openAppSetting() async {
    await _methodChannel.invokeMethod('appSetting');
  }

  void openNotificationSetting() async {
    await _methodChannel.invokeMethod('notificationAppSetting');
  }
}
