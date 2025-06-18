import 'package:get/get.dart' as getx;
import 'package:core/core.dart';

///
/// Error Handler
///
class ErrorHandler {
  static void manageError(String errorCode, String currentRoute,
      {String? moveRoute, Function(String)? errorFunction}) async {
    ErrorCodeType type = ErrorCodeTypeExtension.convertFromString(errorCode);
    bool isToast = ErrorCodeTypeExtension.isToast(type, currentRoute);
    String msg = ErrorCodeTypeExtension.msg(type, currentRoute);
    ErrorCodeActionType action =
        ErrorCodeTypeExtension.doAction(type, currentRoute);
    if (isToast) {
      processAction(action, type);
      ToastHandler().showExceptionError(text: msg);
    }
    if (errorFunction != null) {
      errorFunction.call(type.name);
    }
    if (moveRoute != null) {
      goErrorPage(moveRoute);
    }
  }

  static void goErrorPage(String moveRoute)async{
    await getx.Get.offNamed(Routes.errorPage, arguments: {
      'function': () async {
        await getx.Get.offNamed(moveRoute);
      }
    });
  }

  static void goToSocialLoginPage()async{
    await getx.Get.offAllNamed(Routes.socialLogin);
  }

  static void processAction(
      ErrorCodeActionType type, ErrorCodeType errorType) async {
    switch (type) {
      case ErrorCodeActionType.none:
        return;
      case ErrorCodeActionType.stay:
        return;
      case ErrorCodeActionType.goSocialLogin:
        await getx.Get.offAllNamed(Routes.socialLogin);
        return;
      case ErrorCodeActionType.goBaseLogin:
        await getx.Get.offAllNamed(Routes.baseLogin);
        return;
      case ErrorCodeActionType.goServerInspection:
        await getx.Get.offAllNamed(Routes.serverInspectionPage);
        return;
      case ErrorCodeActionType.goServerUpdate:
        await getx.Get.offAllNamed(Routes.serverUpdatePage);
        return;
      case ErrorCodeActionType.other:
        if (errorType == ErrorCodeType.AU029) {
          return;
        } else if (errorType == ErrorCodeType.HP000) {
          await getx.Get.offAllNamed(Routes.socialLogin);
          return;
        } else if (errorType == ErrorCodeType.AU023) {
          await getx.Get.offAllNamed(Routes.findNoId);
          return;
        }
    }
  }
}
