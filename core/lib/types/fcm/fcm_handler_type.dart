import 'dart:convert';

import 'package:core/core.dart';

enum FCMHandlerType {
  processOnBackground,
  appResumed,
  onDidReceiveNotificationResponse,
  handingNoTouchOnForeground,
  backgroundHandler,
  none
}

extension FcmHandlerTypeExtension on FCMHandlerType {
  static FCMHandlerType convertFromString(String input) {
    switch (input) {
      case 'processOnBackground':
        return FCMHandlerType.processOnBackground;
      case 'appResumed':
        return FCMHandlerType.appResumed;
      case 'onDidReceiveNotificationResponse':
        return FCMHandlerType.onDidReceiveNotificationResponse;
      case 'handingNoTouchOnForeground':
        return FCMHandlerType.handingNoTouchOnForeground;
      case 'backgroundHandler':
        return FCMHandlerType.backgroundHandler;
      default:
        return FCMHandlerType.none;
    }
  }

  bool get isTouch => switch (this) {
        FCMHandlerType.processOnBackground => true,
        FCMHandlerType.appResumed => true,
        FCMHandlerType.onDidReceiveNotificationResponse => true,
        FCMHandlerType.handingNoTouchOnForeground => false,
        FCMHandlerType.backgroundHandler => false,
        FCMHandlerType.none => false,
      };

  bool get isForeground => switch (this) {
        FCMHandlerType.processOnBackground => false,
        FCMHandlerType.appResumed => false,
        FCMHandlerType.onDidReceiveNotificationResponse => true,
        FCMHandlerType.handingNoTouchOnForeground => true,
        FCMHandlerType.backgroundHandler => false,
        FCMHandlerType.none => false,
      };

  static String? extractData(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        return data['data'];
      } else if (data is String?) {
        if (data != null) {
          return json.decode(data)['data'];
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      Log.e('Error : $e');
      return null;
    }
  }
}
