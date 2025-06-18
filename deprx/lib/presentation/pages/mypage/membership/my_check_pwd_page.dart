import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class MyCheckPwdPage extends StatefulWidget {
  MyCheckPwdPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyCheckPwdPage();
}

class _MyCheckPwdPage extends State<MyCheckPwdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final MyPageController _controller = Get.find();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.myPageCheckPwd);
    _controller.currentPwd.value = '';
    _controller.currentPwdError.value = PwdErrorType.none;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pwdFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _pwdFocusNode.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (!value) {
            Get.back();
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
                  title: 'common_appBar_title_resetPwd'.tr,
                  isDeprx: true,
                ),
                const SizedBox(
                  height: 41,
                ),
                _currentPwdContainer(),
                const SizedBox(
                  height: 35,
                ),
                Obx(() {
                  return DPbutton(
                    text: 'common_ctaBtn_confirm'.tr,
                    function: () {
                      _move();
                    },
                    isEnabled:
                        _controller.currentPwdError.value == PwdErrorType.pass,
                  );
                })
              ],
            ),
          ),
        ));
  }

  ///
  /// 현재 비밀번호
  ///
  Widget _currentPwdContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> currentPwdErrorType = _controller.currentPwdError;
        bool notError = currentPwdErrorType.value == PwdErrorType.none ||
            currentPwdErrorType.value == PwdErrorType.pass;
        return DpTextInput(
          controller: _pwdController,
          focusNode: _pwdFocusNode,
          onTap: () {
            _pwdFocusNode.requestFocus();
          },
          isError: !notError,
          onChanged: (value) {
            if (value != null) {
              _controller.checkPwdValid(value);
              _controller.currentPwd.value = value.toLowerCase();
            }
          },
          isObscure: _controller.currentPwdObscure.value,
          label: 'passwordCheck_textfield_label'.tr,
          hintText: 'passwordCheck_textfield_hint'.tr,
          onSubmitted: (value) {
            _move();
          },
          suffixIcon: _controller.currentPwd.value.isNotEmpty
              ? _obscure()
              : const SizedBox.shrink(),
          suffixHeight: 24,
          prefixIcon: _pwdPrefix(type: currentPwdErrorType.value),
          prefixHeight: 24,
          errorText: 'passwordCheck_textfield_hint'.tr,
          maxLength: null,
        );
      }),
    );
  }

  Widget _pwdPrefix({PwdErrorType type = PwdErrorType.none}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Resource.icon('ic_pwd',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(type.iconColor, BlendMode.srcIn)),
    );
  }

  Widget _obscure() {
    return GestureDetector(
      onTap: () {
        _controller.currentPwdObscure.value =
            !_controller.currentPwdObscure.value;
      },
      child: Obx(() {
        return Resource.icon(
            'ic_obscure_${_controller.currentPwdObscure.value ? 'close' : 'open'}',
            width: 24,
            height: 24);
      }),
    );
  }

  void _move() {
    _controller.checkCurrentPwd();
  }
}
