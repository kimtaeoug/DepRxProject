import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';
import 'package:resource/json/json_service.dart';
import 'package:resource/resource.dart';

import '../../../core/service/procedure_service.dart';

class MyPageController extends GetxController {
  final MyPageUseCase myPageUseCase;
  final MembershipUseCase membershipUseCase;

  MyPageController(this.myPageUseCase, this.membershipUseCase);

  final ProcedureService service = Get.find();
  final JsonService _jsonService = JsonService();

  final PrefUtil spUtil = PrefUtil();
  RxString loginType = ''.obs;
  RxString name = ''.obs;

  ///
  /// reward
  ///
  RxBool rewardLoading = true.obs;
  RxList<RewardModel> myPageRewardList = <RewardModel>[].obs;

  void initReward() async {
    if (myPageRewardList.isEmpty) {
      rewardLoading.value = false;
      await myPageUseCase.getMyPageReward(successFunction: (response) {
        myPageRewardList.value = response;
        myPageRewardList.refresh();
        loginType.value = spUtil.loginType;
        name.value = spUtil.userName;
        rewardLoading.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.myPage);
      });
    }
  }

  ///
  /// 비밀번호 재설정
  ///
  final RxString currentPwd = ''.obs;
  final RxBool currentPwdObscure = true.obs;
  final Rx<PwdErrorType> currentPwdError = PwdErrorType.none.obs;
  final RxString newPwd = ''.obs;
  final RxBool newPwdObscure = true.obs;
  final Rx<PwdErrorType> newPwdError = PwdErrorType.none.obs;
  final RxString confirmPwd = ''.obs;
  final RxBool confirmPwdObscure = true.obs;
  final Rx<PwdErrorType> confirmPwdError = PwdErrorType.none.obs;

  final Regex _regex = Regex();

  void checkNewPwdValid(String? input) {
    try{
      if (input != null) {
        if (input == '') {
          newPwdError.value = PwdErrorType.empty;
        } else {
          bool checkLength = _regex.checkLength(input, min: 8, max: 16);
          bool hasEn = _regex.hasEn(input);
          bool hasNm = _regex.hasNumber(input);
          bool hasSpecial = _regex.hasSpecialCharacter(input);
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
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void checkPwdConfirmValid(String? input) {
    try{
      if (input != null) {
        if (input == '') {
          confirmPwdError.value = PwdErrorType.none;
        } else {
          if (confirmPwd.value != newPwd.value) {
            confirmPwdError.value = PwdErrorType.invalid;
          } else {
            confirmPwdError.value = PwdErrorType.pass;
          }
        }
      } else {
        confirmPwdError.value = PwdErrorType.none;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void checkPwdValid(String? input) {
    try{
      if (input != null) {
        if (input == '') {
          currentPwdError.value = PwdErrorType.empty;
        } else {
          currentPwdError.value = PwdErrorType.pass;
        }
      } else {
        currentPwdError.value = PwdErrorType.none;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  ///
  /// term
  ///
  RxMap<TermType, TermModel> termData = <TermType, TermModel>{}.obs;
  final List<TermType> _termList = TermType.values;

  void setTermModelData() async {
    try{
      if (termData.isEmpty) {
        for (TermType type in _termList) {
          termData[type] = await TermTypeExtension.model(type, _jsonService);
        }
        termData.refresh();
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  ///
  /// License
  ///
  Rx<TermModel> licenseData = const TermModel().obs;

  void getLicenseData() async {
    try{
      if (licenseData.value == const TermModel()) {
        licenseData.value = await Resource.termData('license', _jsonService);
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  ///
  /// Available tile
  ///
  List<List<bool>> availableList = <List<bool>>[
    //월요일
    [false, false, false, false],
    //화요일
    [false, false, false, false],
    //수요일
    [false, false, false, false],
    //목요일
    [false, false, false, false],
    //금요일
    [false, false, false, false],
    //토요일
    [false, false, false, false],
    //일요일
    [false, false, false, false]
  ];

  //true, false로
  void availableTimeFunction(DayOfWeekType type, TimeRangeType timeType) {
    try{
      availableList[type.index][timeType.index] =
      !getAvailableListValue(type, timeType);
      update();
    }catch(e){
      ToastHandler().logicError();
    }
  }

  bool getAvailableListValue(DayOfWeekType type, TimeRangeType timeType) =>
      availableList[type.index][timeType.index];

  bool availablePassCondition() {
    for (List<bool> data in availableList) {
      if (!data.contains(true)) {
        return false;
      }
    }
    return true;
  }

  void initAvailableTime({required Function() successFunction}) async {
    await myPageUseCase.getMyPageAlarm(successFunction: (response) {
      availableList = response.availableTimes;
      update();
      successFunction();
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.myPageAlarmPage);
    });
  }

  void changeAvailableTime() async {
    await myPageUseCase.changeAlarm(availableList, successFunction: () {
      Get.back();
      ToastHandler().show('알림 설정이 변경되었습니다!');
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  ///
  /// marketing
  ///
  void changeMarketing(bool marketing) async {
    await myPageUseCase.changeMarketing(marketing, successFunction: () {
      marketingValue.value = marketing;
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  RxBool marketingValue = false.obs;
  RxBool isInit = false.obs;

  void getMarketing() async {
    if (!isInit.value) {
      await myPageUseCase.getMyPageMarketingValue(successFunction: (response) {
        marketingValue.value = response.marketing;
        isInit.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
        isInit.value = false;
      });
    }
  }

  ///
  /// Membership
  ///

  RxBool didLogOut = false.obs;

  //logout
  void logout() async {
    if (!didLogOut.value) {
      didLogOut.value = true;
      await membershipUseCase.logout(successFunction: () async {
        if (loginType.value != '') {
          SocialLoginUtil socialLoginUtil = SocialLoginUtil();
          if (loginType.value == 'GOOGLE') {
            socialLoginUtil.googleLogout();
          }
        }
        Get.back();
        didLogOut.value = false;
        service.clearData();
        FCMHandler.cancelAll();
        ToastHandler().show('logout_toast'.tr);
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            errorFunction: (code) {
          didLogOut.value = false;
          Get.back();
        });
      });
    }
  }

  //leave
  void leave() async {
    await membershipUseCase.leave(successFunction: () {
      AccessTokenUtil().clearAccessToken();
      Get.back();
      Get.offAllNamed(Routes.leaveCompletePage);
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  //check Pwd
  void checkCurrentPwd() async {
    if (currentPwdError.value == PwdErrorType.pass) {
      await membershipUseCase.checkPwd(currentPwd.value, successFunction: () {
        Get.toNamed(Routes.resetPwdPage);
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  //change Pwd
  void changePwd() async {
    if (newPwdError.value == PwdErrorType.pass &&
        confirmPwdError.value == PwdErrorType.pass) {
      await membershipUseCase.resetPwd(
          ResetPwdEntity(
              newPassword: newPwd.value,
              newPasswordConfirm: confirmPwd.value), successFunction: () {
        Get.close(2);
        ToastHandler().show('resetPwd_toast_success_changeComplete'.tr);
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCdoe, Get.currentRoute);
      });
    }
  }

  RxBool allAlarm = true.obs;

  void getAllAlarm() async {
    await myPageUseCase.getMyPageAllAlarm(successFunction: (value) {
      allAlarm.value = value;
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  RxBool changeAllAlarmLoading = false.obs;

  void changeAllAlarm(bool value) async {
    if (!changeAllAlarmLoading.value) {
      changeAllAlarmLoading.value = true;
      allAlarm.value = value;
      await myPageUseCase.changeMyPageAllAlarm(value, successFunction: () {
        changeAllAlarmLoading.value = false;
      }, failFunction: (error) {
        changeAllAlarmLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }
}
