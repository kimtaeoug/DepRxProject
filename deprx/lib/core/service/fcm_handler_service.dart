import 'dart:isolate';
import 'dart:ui';
import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:deprx/core/service/procedure_service.dart';
import 'package:get/get.dart';

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
    IsolateNameServer.lookupPortByName(DEPRX_FCM_PORT)
        ?.send(FCMEntity(input, functionName).toJson());
  }

  @pragma('vm:entry-point')
  static final ReceivePort receivePort = ReceivePort();

  @pragma('vm:entry-point')
  static void registerIsolate() async {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, DEPRX_FCM_PORT);
    receivePort.listen(_listener);
  }

  @pragma('vm:entry-point')
  static void _listener(dynamic input) async {
    print('_listener input : $input');
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
          ObjectBoxUtil().insertFcmData(data);
          break;
        case FCMHandlerType.appResumed:
          procedureService.processFcm(data, isAppResumed: true);
          break;
        case FCMHandlerType.onDidReceiveNotificationResponse:
          procedureService.processFcm(data);
          break;
        case FCMHandlerType.handingNoTouchOnForeground:
          procedureService.processFcm(data);
          break;
        case FCMHandlerType.backgroundHandler:
          ObjectBoxUtil().insertFcmData(data);
          break;
        case FCMHandlerType.none:
          break;
      }
    }
  }
}
