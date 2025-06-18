import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import '../model/default_response_model.dart';

///
/// API Interceptor
/// api 응답 관련 interceptor
///
class APIInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      DioExceptionType type = err.type;
      if (type == DioExceptionType.badResponse ||
          type == DioExceptionType.badCertificate) {
        ErrorHandler.goToSocialLoginPage();
        ToastHandler().showExceptionError(text: 'errorMsg_unexpectedError'.tr);
      }
      DefaultResponseModel responseData =
          DefaultResponseModel.fromJson(err.response?.data);
      if (_haveToGoSocial(responseData.msg)) {
        ErrorHandler.goToSocialLoginPage();
        ToastHandler().showExceptionError(text: 'errorMsg_unexpectedError'.tr);
      }
    } catch (e) {
      ErrorHandler.goToSocialLoginPage();
      ToastHandler().showExceptionError(text: 'errorMsg_unexpectedError'.tr);
      return super.onError(err, handler);
    }
  }

  final List<String> _socialTextList = ['잘못된', '로그인', '인증되지 않은', '접근'];

  bool _haveToGoSocial(String msg) {
    bool result = false;
    for (String text in _socialTextList) {
      if (msg.contains(text)) {
        result = true;
        break;
      }
    }
    return result;
  }
}
