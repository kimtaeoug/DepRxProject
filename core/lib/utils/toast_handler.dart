import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class ToastHandler {
  static final ToastHandler _instance = ToastHandler._();

  ToastHandler._();

  factory ToastHandler() => _instance;

  final ValueNotifier<List<String>> _queue = ValueNotifier([]);
  final ScreenUtil _screenUtil = ScreenUtil();


  void show(String input, {bool isError = false}) async {
    if (!_queue.value.contains(input)) {
      Get.showSnackbar(_toast(input, isError: isError));
    }
  }

  //check
  //2주차하고, 로그아웃하고 로그인했더니 처음
  //kbads 했지만 나옴
  //로그아웃 -> 처음 주차로 가나?
  void showExceptionError({String? text}) {
    String errorMsg = 'errorMain_overview_subTitle'.tr;
    String msg = text ?? errorMsg;
    if (msg.contains('Dio')) {
      msg = errorMsg;
    }
    show(msg, isError: true);
  }

  void logicError(){
    show('errorMsg_unexpectedError'.tr, isError: true);
  }

  void uiError(){
    show('화면을 불러오는데 실패했어요.', isError: true);
  }
  void networkError(){
    show('errorMain_toast_error'.tr, isError : true);
  }


  GetSnackBar _toast(String txt, {bool isError = false}) {
    return GetSnackBar(
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: _screenUtil.h16v12,
      borderRadius: 12,
      backgroundColor:
          isError ? DColors.negativeStatusRed : DColors.primaryNormalColor,
      icon: _screenUtil
          .svgIcon('$ICON_PATH/ic_${isError ? 'caution' : 'check_sharp'}.svg'),
      messageText: Text(
        txt,
        style: DpTextStyle.b4.style
            .copyWith(letterSpacing: -0.32, color: DColors.white),
      ),
      snackPosition: SnackPosition.TOP,
      maxWidth: Get.width,
      snackStyle: SnackStyle.FLOATING,
      boxShadows: _screenUtil.emphasizeShadow(),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.OPENING) {
          _queue.value.add(txt);
        } else if (status == SnackbarStatus.CLOSED) {
          if (_queue.value.contains(txt)) {
            _queue.value.remove(txt);
          }
        }
      },
    );
  }
}
