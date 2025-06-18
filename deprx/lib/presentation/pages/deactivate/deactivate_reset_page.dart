import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:deprx/presentation/controllers/deactivate/deactivate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class DeactivateResetPage extends StatelessWidget {
  DeactivateResetPage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final DeactivateController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleAppBar(
                  title: 'common_appBar_title_resetPwd'.tr,
                  notShowBack: true,
                ),
                Obx(() {
                  return Expanded(
                      child: DeactivateResetPwdFrame(
                          moveFunction: () {
                            Get.offAllNamed(Routes.baseLogin);
                          },
                          clearFindPwd: _controller.clearFindPwd,
                          changePwdPassCondition:
                              _controller.changePwdPassCondition,
                          newPwdType: _controller.newPwdError.value,
                          setNewPwd: (value) {
                            _controller.newPwd.value = value;
                          },
                          checkNewPwdValid: _controller.checkNewPwdValid,
                          newPwdObscure: _controller.newPwdObscure.value,
                          confirmPwdObscure:
                              _controller.confirmPwdObscure.value,
                          newPwd: _controller.newPwd.value,
                          confirmPwdErrorType:
                              _controller.confirmPwdError.value,
                          setConfirmPwd: (value) {
                            _controller.confirmPwd.value = value;
                          },
                          checkPwdConfirmValid:
                              _controller.checkPwdConfirmValid,
                          confirmPwd: _controller.confirmPwd.value,
                          setNewPwdObscure: (value) {
                            _controller.newPwdObscure.value = value;
                          },
                          setConfirmPwdObscure: (value) {
                            _controller.confirmPwdObscure.value = value;
                          },
                          findPwd: (function) {
                            _controller.findPwd(successFunction: function);
                          }));
                })
              ],
            ),
          ),
        ));
  }
}
