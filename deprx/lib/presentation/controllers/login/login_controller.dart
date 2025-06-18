import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class LoginController extends GetxController {
  final MembershipUseCase useCase;

  LoginController(this.useCase);

  final ProcedureService service = Get.find();
  final SocialLoginUtil _socialLoginUtil = SocialLoginUtil();

  @override
  void onInit() {
    super.onInit();
    _socialLoginUtil.init();
  }

  bool passCondition() =>
      idErrorType.value == IdErrorType.pass &&
      pwdErrorType.value == PwdErrorType.pass;

  ///
  /// Email Login Page
  ///
  RxString idInput = ''.obs;
  RxString pwdInput = ''.obs;
  RxBool pwdObscure = true.obs;
  Rx<IdErrorType> idErrorType = IdErrorType.none.obs;
  Rx<PwdErrorType> pwdErrorType = PwdErrorType.none.obs;
  RxBool loginLoading = false.obs;

  void login({bool doForce = false}) async {
    if (!loginLoading.value) {
      loginLoading.value = true;
      await useCase.login(
          LoginEntity(
              id: idInput.value,
              password: pwdInput.value,
              force: doForce,
              fcmToken: (await FCMHandler.getFCMToken()) ?? ''),
          successFunction: (response) {
        ProcedureService service = Get.find();
        service.setProcedure(response);
        spUtil.saveUserName(response.name);
        // ga();
        loginLoading.value = false;
        dpDialog.systemAlert(service.move);
      }, failFunction: (error) {
        loginLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            errorFunction: (code) {
          loginErrorProcess(code);
        });
      });
    }
  }

  void loginErrorProcess(String errorCode, {bool isSocialLogin = false}) async {
    switch (errorCode) {
      case LOGIN_DEACTIVE_CODE:
        deactiveFunction();
        return;
      case DUPLICATE_LOGIN_CODE:
        duplicateFunction(isSocialLogin: isSocialLogin);
        return;
      case LEAVE_PROGRAM_CODE:
        leaveProgramFunction();
        return;
      case END_PROGRAM_CODE:
        endProgramFunction();
        return;
      case CHANGE_PWD_CODE:
        changePwd();
        return;
      case SOCIAL_SIGNUP_CODE:
        bool result =
            await Get.toNamed(Routes.auth, arguments: {'isSocial': true});
        if (!result) {
          kakaoLoginLoading.value = false;
          naverLoginLoading.value = false;
        }
        return;
    }
  }

  final DPDialog dpDialog = DPDialog();

  void deactiveFunction() {
    dpDialog.deactiveFunction(() {
      if (Get.isDialogOpen == true) {
        Get.close(1);
      }
      Get.toNamed(Routes.deactivate);
    });
  }

  void duplicateFunction({bool isSocialLogin = false}) {
    dpDialog.duplicateLogin(() {
      Get.close(1);
      if (isSocialLogin) {
        socialLogin(doForce: true);
      } else {
        login(doForce: true);
      }
    });
  }

  void leaveProgramFunction() {
    dpDialog.leaveProgram(() {
      Get.back();
    });
  }

  void endProgramFunction() {
    dpDialog.endProgram(() {
      Get.back();
    });
  }

  void changePwd() {
    dpDialog.changePwd(() {
      Get.toNamed(Routes.findPwd);
    });
  }

  // void forceLogin(){}

  void ga() async {
    try {
      await useCase.ga(
          successFunction: (ga) {
            GAUtil.setUserProperties(
                userId: ga.user_id, properties: ga.toJson());
          },
          failFunction: (error) {});
    } catch (e) {
      Log.e(e);
    }
  }

  ///
  /// 아이디 유효 여부
  ///
  void checkIdValid(String? input) {
    try {
      if (input != null) {
        if (input == '') {
          idErrorType.value = IdErrorType.empty;
        } else {
          idErrorType.value = IdErrorType.pass;
        }
      } else {
        idErrorType.value = IdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  ///
  /// 비밀번호 유효 여부
  ///
  void checkPwdValid(String? input) {
    try {
      if (input != null) {
        if (input.isNotEmpty) {
          pwdErrorType.value = PwdErrorType.pass;
        } else {
          pwdErrorType.value = PwdErrorType.empty;
        }
      } else {
        pwdErrorType.value = PwdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  ///
  /// 비밀번호 obscure 관리
  ///

  void handlingObscure() {
    try {
      pwdObscure.value = !pwdObscure.value;
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  ///
  /// 구글 로그인
  ///
  void clearSocialData() {
    try {
      socialUUID.value = '';
      socialType.value = '';
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  RxString socialUUID = ''.obs;
  RxBool socialLoginLoading = false.obs;
  RxString errorData = '49'.obs;

  void loginWithGoogle() async {
    if (!socialLoginLoading.value) {
      socialLoginLoading.value = true;
      _socialLoginUtil.googleLogout();
      String? uid = await _socialLoginUtil.loginWithGoogle();
      try {
        if (uid != null) {
          socialUUID.value = uid;
          socialType.value = SocialType.google.upper;
          if (socialUUID.value != '') {
            socialLoginLoading.value = false;
            socialLogin();
          } else {
            socialLoginLoading.value = false;
            _socialLoginFail();
          }
        } else {
          socialLoginLoading.value = false;
        }
      } catch (e, s) {
        socialLoginLoading.value = false;
        _socialLoginFail();
      }
    }
  }

  void _socialLoginFail({
    bool isGoogle = true,
    String? errorText,
  }) {
    ToastHandler().showExceptionError(text: 'errorMsg_login'.tr);
    clearSocialData();
    if (isGoogle) {
      _socialLoginUtil.googleLogout();
    }
  }

  ///
  /// 소셜 로그인
  ///
  RxString socialType = ''.obs;
  final PrefUtil spUtil = PrefUtil();

  void socialLogin({bool doForce = false}) async {
    await useCase.socialLogin(
        SocialLoginEntity(
            socialsUuid: socialUUID.value,
            socialsType: socialType.value,
            force: doForce,
            fcmToken: (await FCMHandler.getFCMToken()) ?? ''),
        successFunction: (response) {
      ProcedureService service = Get.find();
      service.setProcedure(response);
      spUtil.saveLoginType(socialType.value);
      spUtil.saveUserName(response.name);
      // ga();
      dpDialog.systemAlert(() {
        service.move();
      });
    }, failFunction: (error) async {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (errorCode) {
        loginErrorProcess(errorCode, isSocialLogin: true);
      });
    });
  }

  ///
  /// Naver Login
  ///
  RxBool naverLoginLoading = false.obs;

  void loginWithNaver() async {
    if (!naverLoginLoading.value) {
      naverLoginLoading.value = true;
      try {
        bool close = await _socialLoginUtil.closeConnectionToNaver();
        if (close == false) {
          naverLoginLoading.value = false;
          throw Exception("Close NAVER ERROR Occured");
        }
        String? uuid = await _socialLoginUtil.loginWithNaver((){
          naverLoginLoading.value = false;
        });
        if (uuid != null) {
          socialUUID.value = uuid;
          socialType.value = SocialType.naver.upper;
          socialLogin();
        } else {
          naverLoginLoading.value = false;
          throw Exception('Login uuid is null');
        }
      } catch (e) {
        naverLoginLoading.value = false;
        ToastHandler().showExceptionError();
        clearSocialData();
        _socialLoginUtil.closeConnectionToNaver();
      }
    }
  }

  ///
  /// Kakao Login
  ///
  RxBool kakaoLoginLoading = false.obs;

  void loginWithKakao() async {
    if (!kakaoLoginLoading.value) {
      kakaoLoginLoading.value = true;
      try {
        bool close = await _socialLoginUtil.closeConnectionToKakao();
        if (close == false) {
          kakaoLoginLoading.value = false;
          throw Exception("Close KAKAO ERROR Occured");
        }
        String? uuid = await _socialLoginUtil.loginWithKakako((){
          kakaoLoginLoading.value = false;
        });
        if (uuid != null) {
          socialUUID.value = uuid;
          socialType.value = SocialType.kakao.upper;
          socialLogin();
          kakaoLoginLoading.value = false;
        } else {
          kakaoLoginLoading.value = false;
          throw Exception('Login uuid is null');
        }
      } catch (e) {
        kakaoLoginLoading.value = false;
        _socialLoginUtil.logoutInKakao();
        ToastHandler().showExceptionError();
        clearSocialData();
      }
    }
  }

  void socialLoginFunction(SocialType type) {
    switch (type) {
      case SocialType.google:
        GAUtil.trackEvent(name: GAEventList.GOOGLE_LOGIN_CLICK);
        loginWithGoogle();
        break;
      case SocialType.kakao:
        GAUtil.trackEvent(name: GAEventList.KAKAO_LOGIN_CLICK);
        loginWithKakao();
        break;
      case SocialType.naver:
        GAUtil.trackEvent(name: GAEventList.NAVER_LOGIN_CLICK);
        loginWithNaver();
        break;
    }
  }
}
