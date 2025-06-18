import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class JoinController extends GetxController {
  final MembershipUseCase useCase;

  JoinController(this.useCase);

  final ProcedureService service = Get.find();

  ///
  /// 환자 인증 코드
  ///
  RxString authValue = ''.obs;
  RxBool patientLoading = false.obs;

  void authPatient(
      bool? isSocial, Function(String, Function()) successFunction) async {
    if (!patientLoading.value) {
      patientLoading.value = true;
      await useCase.checkPatientCode(authValue.value.trim(),
          successFunction: (data) {
        patientLoading.value = false;
        successFunction(data.hospitalName, () {
          Get.toNamed(Routes.signUpTerms, arguments: {'isSocial': isSocial});
        });
      }, failFunction: (error) {
        patientLoading.value = false;
        authValue.value = '';
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  bool authPatientPassCondition() => authValue.value.isNotEmpty;

  void clearData({bool needConsentClear = false}) {
    try {
      //id&pwd
      idErrorType.value = IdErrorType.none;
      pwdErrorType.value = PwdErrorType.none;
      idValue.value = '';
      pwdValue.value = '';
      pwdConfirmValue.value = '';
      pwdConfirmObscure.value = true;
      //term
      if (needConsentClear) {
        consentList.value = [false, false, false, false, false];
      }
      name.value = '';
      enoughNameLength.value = false;
      enoughKoreanName.value = false;
      modifyBirth.value = false;
      birth.value = DateTime.now();
      gender.value = '';
      address.value = '';
      fixedAddress.value = '';
      detailAddress.value = '';
      phone.value = '';
      phoneAuth.value = '';
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  ///
  /// JoinId & PwdPage
  ///
  Rx<IdErrorType> idErrorType = IdErrorType.none.obs;
  Rx<PwdErrorType> pwdErrorType = PwdErrorType.none.obs;
  RxString idValue = ''.obs;
  RxString pwdValue = ''.obs;
  Rx<PwdErrorType> pwdConfirmErrorType = PwdErrorType.none.obs;
  RxBool pwdObscure = true.obs;
  RxString pwdConfirmValue = ''.obs;
  RxBool pwdConfirmObscure = true.obs;

  ///
  /// 아이디 유효성 Check
  ///
  void checkIdValid(String? input, Regex regex) {
    try {
      if (input != null) {
        if (input == '') {
          idErrorType.value = IdErrorType.none;
        } else {
          bool hasNumber = regex.hasNumber(input);
          bool hasEn = regex.hasEn(input);
          bool checkLength = regex.checkLength(input, min: 8, max: 20);
          if ((hasNumber == true) && hasEn && checkLength) {
            idErrorType.value = IdErrorType.pass;
          } else {
            idErrorType.value = IdErrorType.invalid;
          }
        }
      } else {
        idErrorType.value = IdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  bool idPassCondition() => idErrorType.value == IdErrorType.pass;

  ///
  /// ID 중복확인
  ///
  void checkDuplicateId() async {
    await useCase.checkDuplicateId(idValue.value, successFunction: () {
      UIUtil.closeKeyBoard();
      Get.toNamed(Routes.signUpAccountPwd);
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  bool idErrorShowCondition() =>
      !(idErrorType.value == IdErrorType.none ||
          idErrorType.value == IdErrorType.pass) &&
      idValue.value.isNotEmpty;

  void checkPwdValid(String? input, Regex regex) {
    try {
      if (input != null) {
        if (input == '') {
          pwdErrorType.value = PwdErrorType.empty;
        } else {
          bool checkLength = regex.checkLength(input, min: 8, max: 16);
          bool hasEn = regex.hasEn(input);
          bool hasNm = regex.hasNumber(input);
          bool hasSpecial = regex.hasSpecialCharacter(input);
          if (checkLength && hasEn && hasNm && hasSpecial) {
            pwdErrorType.value = PwdErrorType.pass;
          } else {
            pwdErrorType.value = PwdErrorType.invalid;
          }
          if (pwdConfirmValue.value.isNotEmpty) {
            if (pwdValue.value == pwdConfirmValue.value) {
              pwdConfirmErrorType.value = PwdErrorType.pass;
            } else {
              pwdConfirmErrorType.value = PwdErrorType.invalid;
            }
          }
        }
      } else {
        pwdErrorType.value = PwdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void checkPwdConfirmValid(String? input) {
    try {
      if (input != null) {
        if (input == '') {
          pwdConfirmErrorType.value = PwdErrorType.none;
        } else {
          if (pwdConfirmValue.value != pwdValue.value) {
            pwdConfirmErrorType.value = PwdErrorType.invalid;
          } else {
            pwdConfirmErrorType.value = PwdErrorType.pass;
          }
        }
      } else {
        pwdConfirmErrorType.value = PwdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  bool pwdPassCondition() =>
      pwdErrorType.value == PwdErrorType.pass &&
      pwdConfirmErrorType.value == PwdErrorType.pass;

  ///
  /// 전화번호 인증
  ///
  RxBool loading = false.obs;

  void certPhone(String text, Function() successFunction) async {
    if (phonePassCondition(text)) {
      if (!loading.value) {
        loading.value = true;
        await useCase.certPhone(text, checkDuplicate: true,
            successFunction: () {
          phone.value = text;
          loading.value = false;
          successFunction();
        }, failFunction: (error) {
          loading.value = false;
          ErrorHandler.manageError(error.errorCode, Get.currentRoute);
        });
      }
    }
  }

  ///
  /// 전화번호 인증 확인
  ///
  void certPhoneConfirm(Function() successFunction) async {
    await useCase.confirmCertPhone(phoneAuth.value, phone.value,
        successFunction: () {
      completePhone.value = phone.value;
      successFunction();
    }, failFunction: (error) {
      if (error.errorCode == 'AU022') {
        phoneAuth.value = '';
      }
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  bool certPhonePassCondition() => phoneAuth.value.length == 6;

  ///
  /// term
  /// Term 관련 로직
  /// 0 : all
  /// 1 : service
  /// 2 : privacyConsent
  /// 3 : privacyPolicy
  /// 4 : marketing
  ///
  RxList<bool> consentList = [false, false, false, false, false].obs;

  void clickConsentAll() {
    try {
      if (!consentList.first) {
        consentList.value = consentList.map((e) => true).toList();
      } else {
        consentList.value = consentList.map((e) => false).toList();
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void clickConsentItem(int idx) {
    try {
      if (consentList[idx]) {
        consentList[0] = false;
        consentList[idx] = false;
      } else {
        consentList[idx] = true;
        if (consentList.where((e) => e == true).length >= 4) {
          consentList[0] = true;
        }
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  bool termPassCondition() {
    if (consentList.first == true) {
      return true;
    } else {
      int falseLength = consentList.where((e) => e == false).length;
      if (falseLength >= 3) {
        return false;
      } else {
        if (consentList.last == true) {
          return false;
        } else {
          return true;
        }
      }
    }
  }

  ///
  /// name
  ///
  RxString name = ''.obs;
  RxBool enoughNameLength = false.obs;
  RxBool enoughKoreanName = false.obs;

  bool namePassCondition(String inputName) =>
      inputName.isNotEmpty && enoughKoreanName.value && enoughNameLength.value;

  ///
  /// birth
  ///
  DateTime now = DateTime.now();
  RxBool modifyBirth = false.obs;
  late Rx<DateTime> birth = now.obs;
  RxString gender = ''.obs;

  bool birthPassCondition(String inputGender) =>
      modifyBirth.value == true && inputGender != '';

  ///
  /// 주소
  ///
  RxString address = ''.obs;
  RxString fixedAddress = ''.obs;
  RxString detailAddress = ''.obs;

  bool detailAddressPassCondition(String input) => input.isNotEmpty;

  ///
  /// 전화번호
  ///
  RxString phone = ''.obs;
  RxString phoneAuth = ''.obs;
  RxString completePhone = ''.obs;

  bool phonePassCondition(String input) => input.length == 13;

  RxBool signUpLoading = false.obs;

  ///
  /// 회원가입
  ///
  void signUp() async {
    if (!signUpLoading.value) {
      signUpLoading.value = true;
      await useCase.signUp(
          SignUpEntity(
              code: authValue.value.trim(),
              id: idValue.value,
              password: pwdValue.value,
              marketing: consentList.last,
              gender: gender.value,
              name: name.value,
              birth: TimeUtil.convertDateTo(birth.value, 'yyyy-MM-dd'),
              mainAddress: fixedAddress.value,
              detailAddress: detailAddress.value,
              phoneNumber: completePhone.value), successFunction: () {
        login();
      }, failFunction: (error) {
        signUpLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  void login() async {
    await useCase.login(
        LoginEntity(
            id: idValue.value,
            password: pwdValue.value,
            force: true,
            fcmToken: (await FCMHandler.getFCMToken()) ?? ''),
        successFunction: (response) {
      ProcedureService service = Get.find();
      service.setProcedure(response);
      signUpLoading.value = false;
      Get.offNamed(Routes.signUpKeyword);
    }, failFunction: (error) {
      signUpLoading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  final SocialLoginUtil _socialLoginUtil = SocialLoginUtil();

  ///
  /// 소셜 회원가입
  ///
  void socialSignUp() async {
    if (!signUpLoading.value) {
      signUpLoading.value = true;
      await useCase.socialSignUp(
          SocialSignupEntity(
              socialsType: _socialLoginUtil.socialType,
              socialsUuid: _socialLoginUtil.uuid,
              code: authValue.value.trim(),
              marketing: consentList.last,
              gender: gender.value,
              name: name.value,
              birth: TimeUtil.convertDateTo(birth.value, 'yyyy-MM-dd'),
              mainAddress: fixedAddress.value,
              detailAddress: detailAddress.value,
              phoneNumber: completePhone.value), successFunction: () {
        socialLogin();
        spUtil.saveUserName(name.value);
      }, failFunction: (error) {
        signUpLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  ///
  /// 소셜 로그인
  ///
  final PrefUtil spUtil = PrefUtil();

  void socialLogin() async {
    Log.e('uuid : ${_socialLoginUtil.uuid}');
    await useCase.socialLogin(
        SocialLoginEntity(
            socialsUuid: _socialLoginUtil.uuid,
            socialsType: _socialLoginUtil.socialType,
            force: true,
            fcmToken: (await FCMHandler.getFCMToken()) ?? ''),
        successFunction: (response) {
      ProcedureService service = Get.find();
      service.setProcedure(response);
      spUtil.saveLoginType(_socialLoginUtil.socialType);
      signUpLoading.value = false;
      Get.offNamed(Routes.signUpKeyword);
    }, failFunction: (error) {
      signUpLoading.value = false;
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }
}
