import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/precache_util.dart';
import 'package:resource/screen_util.dart';
import 'package:sham/core/service/fcm_handler_service.dart';
import 'package:sham/core/service/procedure_service.dart';

import '../../presentation/controllers/library/library_controller.dart';

///
/// Service init on Memory
///
class ServiceUtil {
  static Future<void> initService() async {
    AccessTokenUtil();
    FcmHandlerService();
    Get.put(ProcedureService(
        ProcedureUseCase(Get.find<ProcedureRepositoryImpl>())));
    Get.put(LibraryController(
        EducationUseCase(Get.find<EducationRepositoryImpl>()),
        RewardUseCase(Get.find<RewardRepositoryImpl>())));
  }

  static void initUtilWithContext(BuildContext context) {
    PreCacheUtil.precacheImageFromAsset(context);
    NetworkObserverUtil().init(context);
    ScreenUtil().init(context);
  }

  static void initUtilBeforeRun() {
    JsonService().initIsolate(isSham: true);
    PrefUtil().init(isSham: true);
    PackageInfoUtil();
    ObjectBoxUtil();
    ObjectBoxUtil().init(isSham: true);
    AccessTokenUtil();
  }
}
