import 'package:api/domain/usecase/membership_usecase.dart';
import 'package:core/core.dart';
import 'package:core/regex/regex.dart';
import 'package:core/types/membership/pwd_error_type.dart';
import 'package:core/utils/toast_handler.dart';
import 'package:get/get.dart';

class DeactivateController extends GetxController {
  final MembershipUseCase useCase;

  DeactivateController(this.useCase);

  RxString id = ''.obs;
  RxString phone = ''.obs;
  RxString phoneAuth = ''.obs;

  RxString newPwd = ''.obs;
  RxString confirmPwd = ''.obs;
  Rx<PwdErrorType> newPwdError = PwdErrorType.none.obs;
  Rx<PwdErrorType> confirmPwdError = PwdErrorType.none.obs;

  RxBool newPwdObscure = true.obs;
  RxBool confirmPwdObscure = true.obs;

  void clearPwd() {
    try {
      phone.value = '';
      phoneAuth.value = '';
      newPwd.value = '';
      confirmPwd.value = '';
      newPwdError.value = PwdErrorType.none;
      confirmPwdError.value = PwdErrorType.none;
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void certPhone({required Function() successFunction}) async {
    if (phonePassCondition()) {
      await useCase.certPhone(phone.value, successFunction: successFunction,
          failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  bool phonePassCondition() => phone.value.length == 13;

  void checkPhoneAuth({required Function() successFunction}) async {
    await useCase.confirmCertPhone(phoneAuth.value, phone.value,
        successFunction: () {
      successFunction();
      restoreMember();
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  bool phoneAuthPassCondition() => phoneAuth.value.length == 6;

  void findPwd({required Function() successFunction}) async {
    await useCase.findPwd(newPwd.value, confirmPwd.value, id.value,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  final Regex regex = Regex();

  void checkNewPwdValid(String? input) {
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
    try {
      newPwd.value = '';
      confirmPwd.value = '';
      newPwdError.value = PwdErrorType.none;
      confirmPwdError.value = PwdErrorType.none;
    } catch (e) {
      ToastHandler().logicError();
    }
  }

  void restoreMember() async {
    await useCase.restoreMember(phone.value, successFunction: (value) {
      id.value = value.id;
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }
}
