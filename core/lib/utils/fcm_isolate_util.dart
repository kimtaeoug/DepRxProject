import 'dart:isolate';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

///
///
///
class FCMIsolateUtil{
  static final FCMIsolateUtil _instance = FCMIsolateUtil._();
  FCMIsolateUtil._(){
    initIsolate();
  }
  factory FCMIsolateUtil() => _instance;

  ValueNotifier<String> savedFcmData = ValueNotifier('HELLO');
  void initIsolate()async{
    Log.e('initIsolate is invoked');
    ReceivePort receivePort = ReceivePort();
    SendPort sendPort = receivePort.sendPort;
    Isolate isolate = await Isolate.spawn(saveOnIsolate, sendPort);
    Log.e('isolate is spawned');
    receivePort.listen((data){
      Log.e('listenData : $data');
      if(data is SendPort){
        IsolateNameServer.registerPortWithName(data, 'FCM');
        Log.e('registerPortWithNamed');
      }else{
        if(data is String){
          savedFcmData.value = data;
          print('savedFcmData : ${savedFcmData.value}');
        }
      }
    });
  }
  @pragma('vm:entry-point')
  static void sendData(String input){
    print('sendData : $input');
    IsolateNameServer.lookupPortByName('FCM')?.send(input);
  }


  static void saveOnIsolate(SendPort sendPort)async{
    String? savedFcmData = null;
    ReceivePort receivePort = ReceivePort();
    SendPort isolateSendPort = receivePort.sendPort;
    sendPort.send(isolateSendPort);
    receivePort.listen((data){
      Log.e('listenDataOnIsolate : $data');
      if(data is String){
        if(data == 'read'){
          sendPort.send(savedFcmData);
        }else{
          savedFcmData = data;
        }
      }else{

      }
    });
  }

  //  static void requestHistoryDataOnIsolate(SendPort sendPort) async {
//     final DateTime now = DateTime.now();
//     await HistoryClient(Dio(BaseOptions(contentType: "application/json")))
//         .getAllHistory(DateTime(0).millisecondsSinceEpoch,
//             now.millisecondsSinceEpoch, "RAW")
//         .then((result) {
//       for (HistoryOutPutModel data in result) {
//         sendPort.send(MeasureHistoryItemModel(
//             date: DateTime.fromMillisecondsSinceEpoch(data.recordedTime),
//             heartRate: data.heartRate.toInt(),
//             stress: data.stress.toInt(),
//             systolic: data.systolic.toInt(),
//             diastolic: data.diastolic.toInt(),
//             weight: data.weight.toInt(),
//             advice:
//                 '과로에 의한 만성스트레스 상태로 보여집니다. 하루에 최소 2~3번 가벼운 산책이나 명상등의 휴식을 취하시기 바랍니다.'));
//       }
//     });
//   }
}