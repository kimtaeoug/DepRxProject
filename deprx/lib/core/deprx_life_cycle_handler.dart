import 'dart:ui';

import 'package:core/core.dart';
import 'package:deprx/core/service/procedure_service.dart';
import 'package:deprx/presentation/controllers/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
/// AppLifeCycle Handler
///
class DeprxLifeCycleHandler {
  static final DeprxLifeCycleHandler _instance = DeprxLifeCycleHandler._();

  DeprxLifeCycleHandler._();

  factory DeprxLifeCycleHandler() => _instance;

  final ProcedureService _service = Get.find();

  @pragma('vm:entry-point')
  void process(AppLifecycleState state) async {
    print('current : ${Get.currentRoute}');
    switch (state) {
      case AppLifecycleState.detached:
        print('detached in liefcycle');
        break;
      case AppLifecycleState.resumed:
        requestNotiPermission(doFunction: () {
          String? fcmData = ObjectBoxUtil().readFcmData();
          if (fcmData != null) {
            _service.processFcm(fcmData);
          } else {
            if (Get.currentRoute == Routes.splash) {
              Get.find<SplashController>().init(passPermission: true);
            }
          }
        });
        print('resumed in liefcycle');
        break;
      case AppLifecycleState.inactive:
        print('inactive in liefcycle');
        break;
      case AppLifecycleState.hidden:
        permissionUtil.setCheckIsFromSetting(true);
        print('hidden in liefcycle');
        break;
      case AppLifecycleState.paused:
        permissionUtil.setCheckIsFromSetting(true);
        print('paused in liefcycle');
        break;
    }
  }

  final PermissionUtil permissionUtil = PermissionUtil();

  void requestNotiPermission({required Function() doFunction}) async {
    if (permissionUtil.checkIsFromSetting) {
      permissionUtil.setCheckIsFromSetting(false);
      permissionUtil.handlingNotiPermission(successFunction: doFunction);
    }
  }
}
