import 'dart:io';

import 'package:common/common.dart';
import 'package:common/component/common/dot_text.dart';
import 'package:core/core.dart';
import 'package:core/types/error/error_code_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'button/dp_small_button.dart';
import 'button/dp_small_white_button.dart';

class DPDialog {
  final TextStyle _titleStyle =
  DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
  DpTextStyle.b4.style.copyWith(color: DColors.labelAlternativeColor2);
  final ScreenUtil _screenUtil = ScreenUtil();

  final Color _barrierColor = DColors.black.withValues(alpha: 0.7);

  Dialog _dialog({required Widget child}) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      backgroundColor: DColors.white,
      child: child,
    );
  }

  final EdgeInsets _defaultPadding =
  EdgeInsets.symmetric(horizontal: 20, vertical: 24);
  final BoxDecoration _boxDecoration = const BoxDecoration(
      color: DColors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)));

  void showTitleWithSubtitle(String title, String subTitle,
      Function() rightFunction,
      {String? leftText,
        String? rightText,
        Function()? leftFunction,
        double? top,
        double? bottom,
        double? subTitleHorizontal,
        bool barrierDismissible = false}) {
    Get.dialog(
        _dialog(
            child: Container(
              padding: _defaultPadding,
              decoration: _boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: bottom ?? 31, top: top ?? 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                            style: _titleStyle, child: Text(title)),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: subTitleHorizontal ?? 0),
                          child: DefaultTextStyle(
                              style: _subTitleStyle,
                              child: Text(
                                subTitle,
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DPSmallWhiteButton(
                          text: leftText ?? 'common_cancel'.tr,
                          function: () {
                            if (leftFunction != null) {
                              leftFunction();
                            } else {
                              Get.back();
                            }
                          }),
                      DPSmallButton(
                        width: TabletCheckUtil.checkWithoutContext(_screenUtil)
                            ? (129 / 390 *
                            _screenUtil.width) * 1.2
                            : (43 * _screenUtil.width) / 130,
                        text: rightText ?? 'common_ctaBtn_confirm'.tr,
                        function: () {
                          rightFunction();
                        },
                      )
                    ],
                  )
                ],
              ),
            )),
        barrierDismissible: barrierDismissible);
  }

  void showTitleWithSubtitleWithOneButton(String title, String subTitle,
      Function() function,
      {String? btnText,
        bool barrierDismissible = true,
        double contentTopPadding = 17,
        double contentBottomPadding = 31,
        double contentHorizontalPadding = 0}) {
    Get.dialog(
        _dialog(
            child: Container(
              padding: _defaultPadding,
              decoration: _boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: contentBottomPadding, top: contentTopPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                            style: _titleStyle, child: Text(title)),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: contentHorizontalPadding),
                          child: DefaultTextStyle(
                              style: _subTitleStyle, child: Text(subTitle)),
                        )
                      ],
                    ),
                  ),
                  DPSmallButton(
                      width: _screenUtil.width,
                      text: btnText ?? 'common_ctaBtn_confirm'.tr,
                      function: () {
                        function();
                      })
                ],
              ),
            )),
        barrierColor: _barrierColor,
        barrierDismissible: barrierDismissible);
  }

  void showTitleWithOneButton(String title, Function() function,
      {String? btnText, bool barrierDismissible = true}) {
    Get.dialog(
        _dialog(
            child: Container(
              padding: _defaultPadding,
              decoration: _boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  Text(
                    title,
                    style: _titleStyle,
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  DPSmallButton(
                      text: btnText ?? 'common_ctaBtn_confirm'.tr,
                      width: _screenUtil.width,
                      function: function)
                ],
              ),
            )),
        barrierDismissible: barrierDismissible);
  }

  final String _updateTitle = 'updateAppDialog_title'.tr;
  final String _updateSubtitle = 'updateAppDialog_subtitle'.tr;

  //강제 업데이트
  void showForceUpdate(Function() updateFunction) {
    Get.dialog(
        _dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration:
              _boxDecoration.copyWith(boxShadow: _screenUtil.blue10Shadow()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                            style: _titleStyle, child: Text(_updateTitle)),
                        const SizedBox(
                          height: 8,
                        ),
                        DefaultTextStyle(
                            style: _subTitleStyle,
                            child: Text(_updateSubtitle)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 10,
                    ),
                    child: Resource.image(
                        'main_motion_1', width: 100, height: 100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DPSmallWhiteButton(
                          text: 'updateAppDialog_cancelBtn'.tr,
                          function: () {
                            if (Platform.isIOS) {
                              exit(0);
                            } else {
                              SystemNavigator.pop();
                            }
                          }),
                      DPSmallButton(
                        width: (43 * _screenUtil.width) / 130,
                        text: 'updateAppDialog_confirmBtn'.tr,
                        function: () {
                          updateFunction();
                        },
                      )
                    ],
                  )
                ],
              ),
            )),
        barrierColor: _barrierColor);
  }

  //강제 업데이트
  void showFirebaseUpdate() {
    showTitleWithSubtitleWithOneButton(
      '새로운 앱 버전이 있습니다.',
      'APP Tester 어플을 켜서 새로운 버전의 앱을 다운로드해주세요.',
          () {
        Get.back();
      },
    );
  }

  void deactiveFunction(Function() rightFunction) {
    showTitleWithSubtitle('deactivationDialog_title'.tr,
        'deactivationDialog_subtitle'.tr, rightFunction,
        rightText: 'deactivationDialog_confirmBtn'.tr, subTitleHorizontal: 12);
  }

  void duplicateLogin(Function() rightFunction) {
    showTitleWithSubtitle('duplicatedLoginDialog_title'.tr,
        'duplicatedLoginDialog_subtitle'.tr, rightFunction,
        rightText: 'duplicatedLoginDialog_confirmBtn'.tr);
  }

  void checkHospital(String hospital, Function() rightFunction) {
    showTitleWithSubtitle(
        '${'checkHospitalDialog_title'.tr} $hospital',
        'checkHospitalDialog_subtitle'.tr, rightFunction);
  }

  void showDateChanged(Function() function) {
    showTitleWithSubtitleWithOneButton(
        'changedDateDialog_title'.tr, 'changedDateDialog_subtitle?'.tr,
        function,
        contentTopPadding: 40,
        contentBottomPadding: 54,
        barrierDismissible: false);
  }

  //비밀번호 변경 보안
  void changePwd(Function() function) {
    showTitleWithSubtitleWithOneButton(
        'changePwdDialog_title'.tr,
        'changePwdDialog_subtitle'.tr,
            () {
          ToastHandler().show('resetPwd_toast_success_changeComplete'.tr);
          function();
        },
        btnText: 'changePwdDialog_confirmBtn'.tr,
        contentHorizontalPadding: 12,
        barrierDismissible: false);
  }

  final List<String> _textList = [
    'systemGuideDialog_subtitle1'.tr,
    'systemGuideDialog_subtitle2'.tr,
    'systemGuideDialog_subtitle3'.tr
  ];
  final TextStyle _systemAlertStyle = DpTextStyle.b4.style.copyWith(
      fontWeight: FontWeight.w500, color: DColors.labelAlternativeColor2);

  //시스템 로그인시 설명
  void systemAlert(Function() function) {
    Get.dialog(
        _dialog(
            child: Container(
              padding: EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 24),
              decoration: _boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'systemGuideDialog_title'.tr,
                    style: _titleStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DotText(
                        textList: _textList, defaultStyle: _systemAlertStyle),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DPSmallButton(
                    text: 'common_ctaBtn_confirm'.tr,
                    function: function,
                    width: _screenUtil.width,
                  )
                ],
              ),
            )),
        barrierColor: _barrierColor,
        barrierDismissible: false);
  }

  //세션 만료
  void sessionClose(Function() function) {
    showTitleWithSubtitleWithOneButton(
        '세션이 만료되었습니다.', '로그인을 다시 해주세요!', function,
        barrierDismissible: false);
  }

  //업에디읕
  void versionUpdate(String updateVersion, Function() function) {
    showTitleWithOneButton('DepRx가 $updateVersion버전으로\n업데이트 하시겠습니까?', function,
        barrierDismissible: false);
  }

  //프로그램 이탈했을 시
  void leaveProgram(Function() function) {
    ErrorDialogContents contents = ErrorCodeTypeExtension.socialLoginAU030;
    showTitleWithSubtitleWithOneButton(
        'secessionDialog_title'.tr, contents.contents, function);
  }

  //프로그램 종료했을 시
  void endProgram(Function() function) {
    ErrorDialogContents contents = ErrorCodeTypeExtension.socialLoginAU031;
    showTitleWithSubtitleWithOneButton(
        'serviceEndDialog_title'.tr, contents.contents, function);
  }

  // noti 권한 요청
  void notiPermission(Function() function) {
    showTitleWithSubtitleWithOneButton(
        'permissionDialog_title'.tr, 'permissionDialog_subtitle'.tr, function);
  }
}
