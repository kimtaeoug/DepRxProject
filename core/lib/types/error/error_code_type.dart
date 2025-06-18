import 'package:core/config/routes.dart';
import 'package:get/get.dart';

import 'error_dialog_contents.dart';

enum ErrorCodeType {
  SY000,
  AU008,
  AU010,
  AU011,
  AU012,
  AU016,
  AU017,
  AU018,
  AU022,
  AU023,
  AU025,
  AU029,
  AU030,
  AU031,
  MS000,
  MS001,
  MS002,
  HP000,
  HO001,
  HO002,
  BA000,
  BA002,
  BA003,
  KB000,
  EM000,
  AW000,
  RE001,
  EC000,
  AU001,
  AU002,
  AU003,
  AU004,
  AU005,
  AU006,
  AU007,
  AU009,
  AU013,
  AU024,
  AU026,
  SY002,
  SY003,
  UNEXPECTED
}

enum ErrorCodeActionType {
  none,
  stay,
  goSocialLogin,
  goBaseLogin,
  goServerInspection,
  goServerUpdate,
  other
}

//code를 받아 common text를 보냄(다만, route에 따라 다르게 처리)
extension ErrorCodeTypeExtension on ErrorCodeType {
  static ErrorCodeType convertFromString(String input) {
    List<ErrorCodeType> typeList = ErrorCodeType.values;
    ErrorCodeType result = ErrorCodeType.UNEXPECTED;
    for (ErrorCodeType type in typeList) {
      if (input == type.name) {
        result = type;
        break;
      }
    }
    return result;
  }

  static String msg(ErrorCodeType type, String route, {String? subRoute}) {
    switch (type) {
      case ErrorCodeType.SY000:
        break;
      case ErrorCodeType.AU008:
        if (route == Routes.socialLogin || route == Routes.baseLogin) {
          return 'errorMsg_wrongAccount'.tr;
        }
        break;
      case ErrorCodeType.AU010:
        if (route == Routes.deactivateResetPwd) {
          return 'errorMsg_invalidId'.tr;
        } else if (route == Routes.findPwd) {
          if (subRoute != 'resetPwd') {
            return 'errorMsg_noRegisteredId'.tr;
          }
        } else if (route == Routes.splash) {
          return '';
        }
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU011:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU012:
        if (route == Routes.splash) {
          return 'errorMsg_deactivation'.tr;
        }
        break;
      case ErrorCodeType.AU016:
        if (route == Routes.baseLogin) {
          return 'errorMsg_wrongAccount'.tr;
        } else if (route == Routes.deactivateResetPwd ||
            route == Routes.findPwd) {
          return 'errorMsg_noAccount'.tr;
        } else if (route == Routes.splash) {
          return '';
        }
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU018:
        if (route == Routes.findPwd) {
          return 'errorMsg_checkPwd'.tr;
        }
        break;
      case ErrorCodeType.AU022:
        if (route == Routes.deactivate || route == Routes.signUpPersonalInfo) {
          return 'errorMsg_wrongAuthCode'.tr;
        }
        break;
      case ErrorCodeType.AU023:
        if (route == Routes.deactivate) {
          return 'errorMsg_checkPhoneNumber'.tr;
        }
        break;
      case ErrorCodeType.AU025:
        if (route == Routes.splash || route == Routes.socialLogin) {
          return 'errorMsg_deactivation'.tr;
        } else if (route == Routes.signUpAlpha) {
          return 'errorMsg_wrongAccess'.tr;
        }
        return 'errorMsg_tryUnLockAccount'.tr;
      //baselogin -> dialog
      case ErrorCodeType.AU029:
        if (route == Routes.socialLogin) {
          return 'errorMsg_noSocialAccount'.tr;
        }
        break;
      case ErrorCodeType.AU030:
        if (route == Routes.splash) {
          return 'errorMsg_secession'.tr;
        }
        return 'errorMsg_wrongAccess'.tr;
      //baselogin -> dialog
      case ErrorCodeType.MS000:
        if (route == Routes.signUpAccountId) {
          return 'errorMsg_duplicateId'.tr;
        } else if (route == Routes.signUpSummary) {
          return 'errorMsg_alreadySignIn'.tr;
        }
        break;
      //baselogin -> dialog
      case ErrorCodeType.MS001:
        break;
      //socialLogin -> dialog
      case ErrorCodeType.MS002:
        if (route == Routes.signUpPersonalInfo) {
          return 'errorMsg_duplicatedPhoneNumber'.tr;
        }
        break;
      case ErrorCodeType.HP000:
        if (route == Routes.auth) {
          return 'errorMsg_invalidHospitalCode'.tr;
        } else if (route == Routes.signUpSummary) {
          return 'errorMsg_noMatchedHospital'.tr;
        }
        break;
      case ErrorCodeType.HO001:
        if (route == Routes.auth) {
          return 'errorMsg_maximumPatientCount'.tr;
        }
        break;
      case ErrorCodeType.HO002:
        if (route == Routes.auth) {
          return 'errorMsg_invalidHospitalCode'.tr;
        }
        break;
      case ErrorCodeType.BA000:
        if (route == Routes.kBADSProgress ||
            route == Routes.activitySelectPage ||
            route == Routes.mainPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.BA002:
        if (route == Routes.rewardSelectPage ||
            route == Routes.mainPage ||
            route == Routes.activityCompletePage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.BA003:
        if (route == Routes.rewardSelectPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.KB000:
        if (route == Routes.kBADSProgress) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.EM000:
        if (route == Routes.todayEmotionPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.AW000:
        if (route == Routes.rewardFinalPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.RE001:
        if (route == Routes.reportDetailPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.AU017:
        if (route == Routes.resetPwdPage) {
          return 'common_textfiled_error_confirmNewPwd'.tr;
        }
        break;
      case ErrorCodeType.AU031:
        if (route == Routes.splash) {
          return 'errorMsg_endedUser'.tr;
        }
        return 'errorMsg_wrongAccess'.tr;
      //socialLogin -> dialog
      //baselogin -> dialog
      case ErrorCodeType.EC000:
        if (route == Routes.educationPage) {
          return 'errorMsg_unexpectedError'.tr;
        }
        break;
      case ErrorCodeType.AU001:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU002:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU003:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU004:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU005:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU006:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU007:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU009:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU013:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU024:
        return 'errorMsg_wrongAccess'.tr;
      case ErrorCodeType.AU026:
        return 'errorMsg_duplicatedLogin'.tr;
      case ErrorCodeType.SY002:
        return 'errorMsg_outOfService'.tr;
      case ErrorCodeType.SY003:
        return 'errorMsg_serverUpdate'.tr;
      case ErrorCodeType.UNEXPECTED:
        return 'errorMsg_unexpectedError'.tr;
    }
    return 'errorMsg_unexpectedError'.tr;
  }

  static bool isToast(ErrorCodeType type, String route) {
    if (type == ErrorCodeType.AU031 ||
        type == ErrorCodeType.AU030 ||
        type == ErrorCodeType.MS001) {
      if (route == Routes.socialLogin || route == Routes.baseLogin) {
        return false;
      }
    } else if (type == ErrorCodeType.AU025) {
      if (route == Routes.baseLogin) {
        return false;
      }
    }
    if (type == ErrorCodeType.AU029 && route == Routes.socialLogin) {
      return false;
    }
    return true;
  }

  static ErrorDialogContents get socialLoginAU030 => ErrorDialogContents(
      contents: 'secessionDialog_subtitle'.tr, rightBtn: 'common_ctaBtn_confirm'.tr);

  static ErrorDialogContents get socialLoginAU031 => ErrorDialogContents(
      contents: 'serviceEndDialog_subtitle'.tr, rightBtn: 'common_ctaBtn_confirm'.tr);

  static ErrorDialogContents get socialLoginMS001 => ErrorDialogContents(
      contents: 'duplicatedLoginDialog_subtitle'.tr,
      rightBtn: 'duplicatedLoginDialog_confirmBtn'.tr,
      isOneButton: false);

  static ErrorDialogContents get baseLoginAU025 => ErrorDialogContents(
      contents: 'deactivationDialog_subtitle'.tr,
      rightBtn: 'deactivationDialog_confirmBtn'.tr,
      isOneButton: false);

  static ErrorDialogContents get baseLoginAU030 => ErrorDialogContents(
      contents: 'secessionDialog_subtitle'.tr, rightBtn: 'common_ctaBtn_confirm'.tr);

  static ErrorDialogContents get baseLoginAU031 => ErrorDialogContents(
      contents: 'serviceEndDialog_subtitle'.tr, rightBtn: 'common_ctaBtn_confirm'.tr);

  static ErrorDialogContents get baseLoginMS001 => ErrorDialogContents(
      contents: 'duplicatedLoginDialog_subtitle'.tr,
      rightBtn: 'duplicatedLoginDialog_confirmBtn'.tr,
      isOneButton: false);

  //toast일때 처리 어떻게 할지
  static ErrorCodeActionType doAction(ErrorCodeType type, String route) {
    if (route == Routes.splash) {
      return ErrorCodeActionType.goSocialLogin;
    } else if (route == Routes.socialLogin) {
      if (type == ErrorCodeType.AU029) {
        return ErrorCodeActionType.other;
      } else {
        return ErrorCodeActionType.stay;
      }
    } else if (route == Routes.baseLogin) {
      return ErrorCodeActionType.stay;
    } else if (route == Routes.deactivate) {
      if (type == ErrorCodeType.AU010 ||
          type == ErrorCodeType.AU016 ||
          type == ErrorCodeType.AU025) {
        return ErrorCodeActionType.goBaseLogin;
      } else {
        return ErrorCodeActionType.stay;
      }
    } else if (route == Routes.auth) {
      return ErrorCodeActionType.stay;
    } else if (route == Routes.signUpAccountId) {
      return ErrorCodeActionType.stay;
    } else if (route == Routes.signUpPersonalInfo) {
      return ErrorCodeActionType.stay;
    } else if (route == Routes.signUpSummary) {
      if (type == ErrorCodeType.MS000) {
        return ErrorCodeActionType.goSocialLogin;
      } else if (type == ErrorCodeType.HP000) {
        return ErrorCodeActionType.other;
      } else {
        return ErrorCodeActionType.stay;
      }
    } else if (route == Routes.signUpKeyword) {
      return ErrorCodeActionType.stay;
    } else if (route == Routes.signUpAlpha) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.stay;
      } else {
        return ErrorCodeActionType.goSocialLogin;
      }
    } else if (route == Routes.findId) {
      if (type == ErrorCodeType.AU023) {
        return ErrorCodeActionType.other;
      } else {
        return ErrorCodeActionType.stay;
      }
    } else if (route == Routes.findPwd) {
      if (type == ErrorCodeType.AU010 ||
          type == ErrorCodeType.AU016 ||
          type == ErrorCodeType.AU025 ||
          type == ErrorCodeType.AU030 ||
          type == ErrorCodeType.AU031) {
        return ErrorCodeActionType.goBaseLogin;
      }
      return ErrorCodeActionType.stay;
    } else if (route == Routes.bdiSelectPage) {
      return _defaultManageError(type);
    } else if (route == Routes.bdiAutoCompletePage) {
      return _defaultManageError(type);
    } else if (route == Routes.kBADSProgress) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.stay;
      }
      return _defaultManageError(type);
    } else if (route == Routes.todayEmotionPage) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.stay;
      }
      if (type == ErrorCodeType.EM000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.activitySelectPage) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.stay;
      } else if (type == ErrorCodeType.BA000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.mainPage) {
      if (type == ErrorCodeType.BA002 ||
          type == ErrorCodeType.BA000 ||
          type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.rewardMainPage) {
      return _defaultManageError(type);
    } else if (route == Routes.rewardStoragePage) {
      return _defaultManageError(type);
    } else if (route == Routes.rewardSelectPage ||
        route == Routes.rewardSelectDetailPage) {
      if (type == ErrorCodeType.SY000 ||
          type == ErrorCodeType.BA003 ||
          type == ErrorCodeType.BA002) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.rewardReceiveWeekPage ||
        route == Routes.rewardReceiveStampPage) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.rewardFinalPage) {
      if (type == ErrorCodeType.AW000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.reportDetailPage) {
      if (type == ErrorCodeType.SY000 || type == ErrorCodeType.RE001) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.educationPage) {
      if (type == ErrorCodeType.SY000 || type == ErrorCodeType.EC000) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.activityCompletePage) {
      if (type == ErrorCodeType.SY000 || type == ErrorCodeType.BA002) {
        return ErrorCodeActionType.goSocialLogin;
      }
      return _defaultManageError(type);
    } else if (route == Routes.resetPwdPage) {
      if (type == ErrorCodeType.SY000) {
        return ErrorCodeActionType.goSocialLogin;
      } else if (type == ErrorCodeType.AU017 || type == ErrorCodeType.AU018) {
        return ErrorCodeActionType.stay;
      }
      return _defaultManageError(type);
    }
    return ErrorCodeActionType.none;
  }

  static ErrorCodeActionType _defaultManageError(ErrorCodeType type) {
    if (type == ErrorCodeType.AU025) {
      return ErrorCodeActionType.goBaseLogin;
    }
    return ErrorCodeActionType.goSocialLogin;
  }
}
