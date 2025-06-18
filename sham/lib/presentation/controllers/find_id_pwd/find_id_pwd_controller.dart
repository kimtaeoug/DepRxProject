import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../../core/service/procedure_service.dart';

class FindIdPwdController extends GetxController {
  final MembershipUseCase useCase;

  FindIdPwdController(this.useCase);

  final ProcedureService service = Get.find();

  ///
  /// ID 찾기
  ///
  RxString idPhone = ''.obs;
  RxString idPhoneAuth = ''.obs;
  RxString findIdResult = ''.obs;
  RxString findIdResultSocialType = ''.obs;

  void clearId() {
    try {
      idPhone.value = '';
      idPhoneAuth.value = '';
      findIdResult.value = '';
      findIdResultSocialType.value = '';
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void certPhoneInFindId({required Function() successFunction}) async {
    if (idPhonePassCondition()) {
      await useCase.certPhone(idPhone.value, successFunction: successFunction,
          failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  void checkPhoneAuthInFindId({required Function() successFunction}) async {
    await useCase.confirmCertPhone(idPhoneAuth.value, idPhone.value,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  void findId({required Function() successFunction}) async {
    await useCase.findId(idPhone.value, successFunction: (value) {
      findIdResult.value = value.id;
      findIdResultSocialType.value = value.socialsType;
      successFunction();
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  bool idPhonePassCondition() => idPhone.value.length == 13;

  bool idPhoneAuthPassCondition() => idPhoneAuth.value.length == 6;

  //controller.idPhone.value.length == 13

  ///
  /// PWD 찾기
  ///
  RxString pwdId = ''.obs;
  Rx<IdErrorType> pwdIdErrorType = IdErrorType.none.obs;
  RxString pwdPhone = ''.obs;
  RxString pwdPhoneAuth = ''.obs;

  RxString newPwd = ''.obs;
  RxString confirmPwd = ''.obs;
  Rx<PwdErrorType> newPwdError = PwdErrorType.none.obs;
  Rx<PwdErrorType> confirmPwdError = PwdErrorType.none.obs;

  RxBool newPwdObscure = true.obs;
  RxBool confirmPwdObscure = true.obs;

  bool pwdIdPassCondition() => pwdIdErrorType.value == IdErrorType.pass;

  void clearPwd() {
    try {
      pwdId.value = '';
      pwdIdErrorType.value = IdErrorType.none;
      pwdPhone.value = '';
      pwdPhoneAuth.value = '';
      newPwd.value = '';
      confirmPwd.value = '';
      newPwdError.value = PwdErrorType.none;
      confirmPwdError.value = PwdErrorType.none;
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void checkIdInFindPwd({required Function() successFunction}) async {
    await useCase.checkIdExistingInFindPwd(pwdId.value,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  void checkPwdIdValid(String? input, Regex regex) {
    try {
      if (input != null) {
        if (input == '') {
          pwdIdErrorType.value = IdErrorType.none;
        } else {
          bool hasNumber = regex.hasNumber(input);
          bool hasEn = regex.hasEn(input);
          bool checkLength = regex.checkLength(input, min: 6, max: 12);
          if ((hasNumber == true) && hasEn && checkLength) {
            pwdIdErrorType.value = IdErrorType.pass;
          } else {
            pwdIdErrorType.value = IdErrorType.invalid;
          }
        }
      } else {
        pwdIdErrorType.value = IdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void certPhoneInFindPwd({required Function() successFunction}) async {
    if (pwdPhonePassCondition()) {
      await useCase.certPhone(pwdPhone.value, successFunction: successFunction,
          failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  bool pwdPhonePassCondition() => pwdPhone.value.length == 13;

  void checkPhoneAuthInFindPwd({required Function() successFunction}) async {
    await useCase.confirmCertPhone(pwdPhoneAuth.value, pwdPhone.value,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  bool pwdPhoneAuthPassCondition() => pwdPhoneAuth.value.length == 6;

  void findPwd({required Function() successFunction}) async {
    await useCase.findPwd(newPwd.value, confirmPwd.value, pwdId.value,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  void checkNewPwdValid(String? input, Regex regex) {
    try {
      if (input != null) {
        if (input == '') {
          newPwdError.value = PwdErrorType.empty;
        } else {
          bool checkLength = regex.checkLength(input, min: 8, max: 16);
          bool hasEn = regex.hasEn(input);
          bool hasNm = regex.hasNumber(input);
          bool hasSpecial = regex.hasSpecialCharacter(input);
          if (checkLength && hasEn && hasNm && hasSpecial) {
            newPwdError.value = PwdErrorType.pass;
          } else {
            newPwdError.value = PwdErrorType.invalid;
          }
          if (confirmPwd.value.isNotEmpty) {
            if (confirmPwd.value == newPwd.value) {
              confirmPwdError.value = PwdErrorType.pass;
            } else {
              confirmPwdError.value = PwdErrorType.invalid;
            }
          }
        }
      } else {
        newPwdError.value = PwdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void checkPwdConfirmValid(String? input) {
    try {
      if (input != null) {
        if (input == '') {
          confirmPwdError.value = PwdErrorType.none;
        } else {
          if (newPwd.value == confirmPwd.value) {
            confirmPwdError.value = PwdErrorType.pass;
          } else {
            confirmPwdError.value = PwdErrorType.invalid;
          }
        }
      } else {
        confirmPwdError.value = PwdErrorType.none;
      }
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  bool changePwdPassCondition() =>
      newPwdError.value == PwdErrorType.pass &&
      confirmPwdError.value == PwdErrorType.pass;

  void clearFindPwd() {
    newPwd.value = '';
    confirmPwd.value = '';
    newPwdError.value = PwdErrorType.none;
    confirmPwdError.value = PwdErrorType.none;
  }
}
