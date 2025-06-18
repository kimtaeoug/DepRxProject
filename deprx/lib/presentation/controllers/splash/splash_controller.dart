import 'package:common/common.dart';
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
  final LanguagePackUtil languagePackUtil = LanguagePackUtil();
  final PermissionUtil permissionUtil = PermissionUtil();

  void init({bool passPermission = false}) async {
    try {
      languagePackUtil.initLanguage(JsonService(), () async {
        Log.e('1');
        String accessToken = (await accessTokenUtil.initAccessToken()) ?? '';
        bool doProceed = await _remoteConfigHandler.getRemoteConfig(
            KeyConfiguration().remoteConfigKey, forceUpdateFunction);
        if (doProceed) {
          Log.e('2');
          if (passPermission) {
            Log.e('3');
            _doFunction(accessToken);
          } else {
            Log.e('4');
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
    Log.e('5');
    bool showOnBoarding = _spUtil.showServiceOnboarding;
    if (showOnBoarding == false) {
      Log.e('6');
      await Get.offNamed(Routes.serviceOnboardingPage);
      return;
    }
    if (accessToken.isEmpty || accessToken == '') {
      Log.e('7');
      await Get.offNamed(Routes.socialLogin);
      return;
    } else {
      _procedureService.getProcedure(successFunction: (data) async {
        Log.e('8');
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
