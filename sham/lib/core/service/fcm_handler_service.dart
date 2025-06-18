import 'dart:isolate';
import 'dart:ui';

import 'package:api/domain/entities/fcm/fcm_entity.dart';
import 'package:core/config/constants.dart';
import 'package:core/types/fcm/fcm_handler_type.dart';
import 'package:core/utils/ob_box/objectbox_util.dart';
import 'package:get/get.dart';
import 'package:sham/core/service/procedure_service.dart';

@pragma('vm:entry-point')
class FcmHandlerService {
  static final FcmHandlerService _instance = FcmHandlerService._();

  @pragma('vm:entry-point')
  FcmHandlerService._() {
    startListener();
  }

  factory FcmHandlerService() => _instance;

  @pragma('vm:entry-point')
  void startListener() {
    registerIsolate();
  }

  @pragma('vm:entry-point')
  static void sendDataToIsolate(dynamic input, String functionName) async {
    IsolateNameServer.lookupPortByName(SHAM_FCM_PORT)
        ?.send(FCMEntity(input, functionName).toJson());
  }

  @pragma('vm:entry-point')
  static final ReceivePort receivePort = ReceivePort();

  @pragma('vm:entry-point')
  static void registerIsolate() async {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, SHAM_FCM_PORT);
    receivePort.listen(_listener);
  }

  @pragma('vm:entry-point')
  static void _listener(dynamic input) async {
    print("FCM INPUT : $input");
    if (input is Map<String, dynamic>) {
      FCMEntity converted = FCMEntity.fromJson(input);
      dynamic rawData = converted.data;
      String functionName = converted.functionName;
      final ProcedureService procedureService = Get.find();
      FCMHandlerType type =
      FcmHandlerTypeExtension.convertFromString(functionName);
      String? data = FcmHandlerTypeExtension.extractData(rawData);
      switch (type) {
        case FCMHandlerType.processOnBackground:
          print("processOnBackground is invoked");
          ObjectBoxUtil().insertFcmData(data);
          break;
        case FCMHandlerType.appResumed:
          print("appResumed is invoked");
          procedureService.processFcm(data, isAppResumed: true);
          break;
        case FCMHandlerType.onDidReceiveNotificationResponse:
          print("onDidReceiveNotificationResponse is invoked");
          procedureService.processFcm(data);
          break;
        case FCMHandlerType.handingNoTouchOnForeground:
          print("handingNoTouchOnForeground is invoked");
          procedureService.processFcm(data);
          break;
        case FCMHandlerType.backgroundHandler:
          print("backgroundHandler is invoked");
          ObjectBoxUtil().insertFcmData(data);
          break;
        case FCMHandlerType.none:
          break;
      }
    }
  }
}
