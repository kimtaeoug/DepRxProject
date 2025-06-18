import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

import '../../controllers/find_id_pwd/find_id_pwd_controller.dart';

class FindPwdPage extends StatefulWidget {
  FindPwdPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindPwdPage();
}

class _FindPwdPage extends State<FindPwdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final PageController _pageController = PageController();
  int currentIdx = 0;
  final FindIdPwdController controller = Get.find();

  List<Widget> _frameList() => [
        Obx(() {
          return FindPwdIdFrame(
            moveFunction: _move,
            clearFindPwd: () {
              controller.clearFindPwd();
            },
            pwdId: controller.pwdId.value,
            pwdIdErrorType: controller.pwdIdErrorType.value,
            checkPwdIdValid: (input, regex) {
              controller.checkPwdIdValid(input, regex);
            },
            setPwdId: (value) {
              controller.pwdId.value = value.toLowerCase();
            },
            pwdIdPassCondition: () => controller.pwdIdPassCondition(),
            checkIdInFindPwd: (function) {
              controller.checkIdInFindPwd(successFunction: function);
            },
          );
        }),
        Obx(() {
          return FindPwdPhoneFrame(
            moveFunction: _move,
            pwdPhone: controller.pwdPhone.value,
            pwdPhonePassCondition: () => controller.pwdPhonePassCondition(),
            setPwdPhone: (value) {
              controller.pwdPhone.value = value;
            },
            certPhoneInFindPwd: (function) {
              controller.certPhoneInFindPwd(successFunction: function);
            },
          );
        }),
        Obx(() {
          return FindPwdPhoneAuthFrame(
            moveFunction: _move,
            pwdPhoneAuth: controller.pwdPhoneAuth.value,
            pwdPhoneAuthPassCondition: () =>
                controller.pwdPhoneAuthPassCondition(),
            setPwdPhoneAuth: (value) {
              controller.pwdPhoneAuth.value = value;
            },
            certPhoneInFindPwd: (function) {
              controller.certPhoneInFindPwd(successFunction: function);
            },
            checkPhoneAuthInFindPwd: (function) {
              controller.checkPhoneAuthInFindPwd(successFunction: function);
            },
          );
        }),
        Obx(() {
          return FindPwdResultFrame(
            moveFunction: _move,
            clearFindPwd: () {
              controller.clearFindPwd();
            },
            changePwdPassCondition: () => controller.changePwdPassCondition(),
            newPwdType: controller.newPwdError.value,
            setNewPwd: (value) {
              controller.newPwd.value = value;
            },
            checkNewPwdValid: (value, regex) {
              controller.checkNewPwdValid(value, regex);
            },
            newPwdObscure: controller.newPwdObscure.value,
            confirmPwdObscure: controller.confirmPwdObscure.value,
            newPwd: controller.newPwd.value,
            confirmPwdErrorType: controller.confirmPwdError.value,
            setConfirmPwd: (value) {
              controller.confirmPwd.value = value;
            },
            checkPwdConfirmValid: (value) {
              controller.checkPwdConfirmValid(value);
            },
            confirmPwd: controller.confirmPwd.value,
            setConfirmPwdObscure: (value) {
              controller.confirmPwdObscure.value = value;
            },
            setNewPwdObscure: (value) {
              controller.newPwdObscure.value = value;
            },
            findPwd: (function) {
              controller.findPwd(successFunction: function);
            },
          );
        })
      ];

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.findPwd);
    controller.clearPwd();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            _move(isForward: false);
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleAppBar(
                  title: currentIdx == _frameList().length - 1
                      ? 'common_appBar_title_resetPwd'.tr
                      : 'common_findPwd'.tr,
                  backFunction: () {
                    _move(isForward: false);
                  },
                ),
                Expanded(
                    child: PageView.builder(
                        pageSnapping: false,
                        padEnds: false,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (idx) {
                          setState(() {
                            currentIdx = idx;
                          });
                        },
                        itemCount: _frameList().length,
                        itemBuilder: (context, idx) {
                          return _frameList()[idx];
                        }))
              ],
            ),
          ),
        ));
  }

  final Duration _duration = const Duration(milliseconds: 300);

  void _move({bool isForward = true}) {
    if (isForward) {
      if (currentIdx != _frameList().length - 1) {
        currentIdx += 1;
        _pageController.animateToPage(currentIdx,
            duration: _duration, curve: Curves.linear);
      } else {
        ToastHandler().show('resetPwd_toast_success_changeComplete'.tr);
        Get.back();
      }
    } else {
      if (currentIdx != 0) {
        if (currentIdx == _frameList().length - 1) {
          currentIdx = currentIdx - 2;
          _pageController.animateToPage(currentIdx,
              duration: _duration, curve: Curves.linear);
          controller.idPhoneAuth.value = '';
        } else {
          currentIdx--;
          _pageController.animateToPage(currentIdx,
              duration: _duration, curve: Curves.linear);
        }
      } else {
        Get.back();
      }
    }
  }
}
