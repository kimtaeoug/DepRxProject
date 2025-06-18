import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'firebase_crash_util.dart';

class GAUtil {
  static final FirebaseAnalytics _firebaseAnalytics =
      FirebaseAnalytics.instance;

  static Future trackEvent({
    required String name,
    Map<String, Object>? params,
    bool isDeprx = true
  }) async {
    if (!kDebugMode) {
      try {
        Map<String, Object> param = {};
        if(params != null){
          param = params;
        }
        param['deprx'] = isDeprx;
        param['sham'] = !isDeprx;
        await _firebaseAnalytics.logEvent(name: name, parameters: param);
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static Future logSelectContent(
      {required String contentType, required String itemId}) async {
    if (!kDebugMode) {
      try {
        await _firebaseAnalytics.logSelectContent(
            contentType: contentType, itemId: itemId);
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static Future logScreen(
      {required String screenName, Map<String, Object>? params, bool isDeprx = true}) async {
    if (!kDebugMode) {
      try {
        Map<String, Object> param = {};
        if(params != null){
          param = params;
        }
        param['deprx'] = isDeprx;
        param['sham'] = !isDeprx;
        await _firebaseAnalytics.logEvent(name: screenName, parameters: param);
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static Future setUserProperties(
      {required String userId,
      required Map<String, dynamic> properties}) async {
    if (!kDebugMode) {
      try {
        await _firebaseAnalytics.setUserId(id: userId);
        for (String key in properties.keys) {
          await _firebaseAnalytics.setUserProperty(
              name: key, value: properties[key]);
        }
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static Future setDefaultEventParams(
      {required Map<String, dynamic> params}) async {
    if (!kDebugMode) {
      try {
        await _firebaseAnalytics.setDefaultEventParameters(params);
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static Future checkAppOpen({Map<String, Object>? params}) async {
    if (!kDebugMode) {
      try {
        await _firebaseAnalytics.logAppOpen(parameters: params);
      } catch (e, s) {
        SentryUtil.captureExceptionWithSentry(e, s);
      }
    }
  }

  static void trackBack() {
    trackEvent(name: GAEventList.BACK_BUTTON_CLICK, params: {
      GAParameter.SCREEN_NAME: Get.currentRoute,
      GAParameter.PREVIOUS_ROUTE: Get.previousRoute
    });
  }
}
