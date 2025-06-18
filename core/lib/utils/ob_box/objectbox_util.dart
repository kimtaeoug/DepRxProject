import 'dart:io';

import 'package:core/config/constants.dart';
import 'package:core/utils/ob_box/fcm_box.dart';
import 'package:core/utils/ob_box/scheduler_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../objectbox.g.dart';

@pragma('vm:entry-point')
class ObjectBoxUtil {
  static final ObjectBoxUtil _instance = ObjectBoxUtil._();

  ObjectBoxUtil._();

  factory ObjectBoxUtil() => _instance;
  Box? fcmBox;
  Box? schedulerBox;

  @pragma('vm:entry-point')
  void init({bool isSham = false}) async {
    Directory dir = await getApplicationDocumentsDirectory();
    Store store = await openStore(
        directory:
            path.join(dir.path, isSham ? SHAM_OBJECT_BOX : DEPRX_OBJECT_BOX));
    fcmBox = store.box<FCMBox>();
    schedulerBox = store.box<SchedulerBox>();
  }

  @pragma('vm:entry-point')
  int? insertFcmData(String? fcmData) {
    print("insertFcmData : $fcmData");
    try {
      return fcmBox?.put(FCMBox(fcmData: fcmData));
    } catch (e) {
      return null;
    }
  }

  @pragma('vm:entry-point')
  String? readFcmData() {
    try {
      FCMBox? read = fcmBox?.getAll().last;
      print('readFcmData : ${read?.fcmData}');
      return read?.fcmData;
    } catch (e) {
      return null;
    }
  }

  @pragma('vm:entry-point')
  int? clearFcmData() {
    try {
      return fcmBox?.removeAll();
    } catch (e) {
      return null;
    }
  }

  @pragma('vm:entry-point')
  int? insertSchedulerData(String? data) {
    try {
      return schedulerBox?.put(SchedulerBox(data: data));
    } catch (e) {
      return null;
    }
  }

  @pragma('vm:entry-point')
  String? readSchedulerData() {
    try {
      SchedulerBox? read = schedulerBox?.getAll().last;
      return read?.data;
    } catch (e) {
      return null;
    }
  }

  @pragma('vm:entry-point')
  int? clearSchedulerData() {
    try {
      return schedulerBox?.removeAll();
    } catch (e) {
      return null;
    }
  }
}
