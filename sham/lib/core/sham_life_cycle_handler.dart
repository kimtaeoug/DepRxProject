import 'dart:ui';

import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:sham/core/service/procedure_service.dart';

import '../presentation/controllers/splash/splash_controller.dart';

class ShamLifeCycleHandler {
  static final ShamLifeCycleHandler _instance = ShamLifeCycleHandler._();

  ShamLifeCycleHandler._();

  factory ShamLifeCycleHandler() => _instance;

  final ProcedureService _service = Get.find();

  @pragma('vm:entry-point')
  void process(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
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
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        permissionUtil.setCheckIsFromSetting(true);
        break;
      case AppLifecycleState.paused:
        permissionUtil.setCheckIsFromSetting(true);
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
