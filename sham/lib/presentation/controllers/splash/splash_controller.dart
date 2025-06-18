import 'package:common/component/common/dp_dialog.dart';
import 'package:core/core.dart';
import 'package:core/utils/firebase_update_util.dart';

import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/lanugage/language_pack_util.dart';

import '../../../core/service/procedure_service.dart';
import 'package:encryption/encryption.dart';

class SplashController extends GetxController {
  final PrefUtil _spUtil = PrefUtil();
  final SecureStorageUtil secureStorageUtil = SecureStorageUtil();
  final RemoteConfigHandler _remoteConfigHandler = RemoteConfigHandler();
  final AccessTokenUtil accessTokenUtil = AccessTokenUtil();
  final ProcedureService _procedureService = Get.find();
  final FirebaseUpdateUtil firebaseUpdateUtil = FirebaseUpdateUtil();
  final DPDialog _dialog = DPDialog();
  final PermissionUtil permissionUtil = PermissionUtil();
  final LanguagePackUtil languagePackUtil = LanguagePackUtil();

  void init({bool passPermission = false}) async {
    try {
      languagePackUtil.initLanguage(JsonService(), () async {
        String accessToken = (await accessTokenUtil.initAccessToken()) ?? '';
        bool doProceed = await _remoteConfigHandler.getRemoteConfig(
            KeyConfiguration().remoteConfigKey, forceUpdateFunction);
        if (doProceed) {
          if (passPermission) {
            _doFunction(accessToken);
          } else {
            permissionUtil.handlingNotiPermission(
                successFunction: () {
                  _doFunction(accessToken);
                },
                isSplash: true);
          }
        }
      }, (e) {
        throw Exception(e);
      });
    } catch (e) {
      ToastHandler().showExceptionError();
      _failFunction();
    }
  }

  void _doFunction(String accessToken) async {
    bool showOnBoarding = _spUtil.showServiceOnboarding;
    if (showOnBoarding == false) {
      await Get.offNamed(Routes.serviceOnboardingPage);
      return;
    }
    if (accessToken.isEmpty || accessToken == '') {
      await Get.offNamed(Routes.socialLogin);
      return;
    } else {
      _procedureService.getProcedure(successFunction: (data) async {
        SplashUtil.preWord();
        _procedureService.move();
      }, failFunction: () {
        _failFunction();
      }, loginFailFunction: () {
        accessTokenUtil.setAccessToken('');
        _failFunction();
      }, recursionFlag: false);
    }
  }

  void _failFunction() async {
    SplashUtil.preWord();
    accessTokenUtil.setAccessToken('');
    _procedureService.clearProcedure();
    ErrorHandler.manageError('AU001', Get.currentRoute);
  }

  void forceUpdateFunction() {
    _dialog.showForceUpdate(() {
      UpdateUtil().immediateUpdate();
    });
  }
}
