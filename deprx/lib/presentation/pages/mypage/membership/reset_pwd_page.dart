import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ResetPwdPage extends StatefulWidget {
  ResetPwdPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResetPwdPage();
}

class _ResetPwdPage extends State<ResetPwdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Regex _regex = Regex();

  final MyPageController _controller = Get.find();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();

  final FocusNode _newPwdFocusNode = FocusNode();
  final FocusNode _confirmFocusNode = FocusNode();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.resetPwd);
    _controller.newPwd.value = '';
    _controller.confirmPwd.value = '';
    _controller.newPwdError.value = PwdErrorType.none;
    _controller.confirmPwdError.value = PwdErrorType.none;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _newPwdFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _newPwdController.dispose();
    _confirmPwdController.dispose();
    _newPwdFocusNode.dispose();
    _confirmFocusNode.dispose();
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
                _newPwdContainer(),
                const SizedBox(
                  height: 24,
                ),
                _pwdConfirmContainer(),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  return DPbutton(
                    text: 'common_ctaBtn_applyChange'.tr,
                    function: () {
                      GAUtil.trackEvent(
                          name: GAEventList.PASSWORD_RESET_SUBMIT,
                          params: {
                            GAParameter.SUCCESS: 'true',
                            GAParameter.CONTEXT: 'mypage'
                          });
                      _move();
                    },
                    isEnabled: _controller.newPwdError.value ==
                            PwdErrorType.pass &&
                        _controller.confirmPwdError.value == PwdErrorType.pass,
                  );
                })
              ],
            ),
          ),
        ));
  }

  final TextStyle _errorDefaultStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);

  ///
  /// 새 비밀번호
  ///
  Widget _newPwdContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> type = _controller.newPwdError;
        bool notError =
            type.value == PwdErrorType.none || type.value == PwdErrorType.pass;
        return DpTextInput(
          controller: _newPwdController,
          onChanged: (value) {
            if (value != null) {
              _controller.newPwd.value = value.toLowerCase();
              _controller.checkNewPwdValid(value);
            }
          },
          onTap: () {
            _newPwdFocusNode.requestFocus();
          },
          onSubmitted: (value) {
            _confirmFocusNode.requestFocus();
          },
          focusNode: _newPwdFocusNode,
          isObscure: _controller.newPwdObscure.value,
          label: 'common_textfield_label_newPwd'.tr,
          hintText: 'common_textfield_hint_newPwd'.tr,
          suffixHeight: 24,
          suffixIcon: _controller.newPwd.value.isNotEmpty
              ? _obscure()
              : const SizedBox.shrink(),
          prefixHeight: 24,
          prefixIcon: _pwdPrefix(type: type.value),
          maxLength: null,
          inputFormat: [_regex.numberEnglishSpecialFormatter],
          errorWidget: _showNewPwdCondition(notError)
              ? _newPwdErrorText()
              : const SizedBox.shrink(),
        );
      }),
    );
  }

  bool _showNewPwdCondition(bool notError) =>
      !notError && _controller.newPwd.value.isNotEmpty;

  Widget _newPwdErrorText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '${'common_textfield_error_pwd1'.tr}, ',
            style:
                !(_regex.checkLength(_controller.newPwd.value, min: 8, max: 16))
                    ? _errorStyle
                    : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id2'.tr}, ',
            style: !_regex.hasEn(_controller.newPwd.value)
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_pwd2'.tr}, ',
            style: !(_regex.hasNumber(_controller.newPwd.value))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: 'common_textfield_error_pwd3'.tr,
            style: !(_regex.hasSpecialCharacter(_controller.newPwd.value))
                ? _errorStyle
                : _errorDefaultStyle),
      ])),
    );
  }

  ///
  /// 새 비밀번호 다시 입력
  ///
  Widget _pwdConfirmContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> type = _controller.confirmPwdError;
        RxString pwdConfirmValue = _controller.confirmPwd;
        return DpTextInput(
          controller: _confirmPwdController,
          onChanged: (value) {
            if (value != null) {
              _controller.confirmPwd.value = value.toLowerCase();
              _controller.checkPwdConfirmValid(value);
            }
          },
          label: 'common_textfield_label_confirmNewPwd'.tr,
          hintText: 'common_textfield_hint_pwd'.tr,
          isError: type.value == PwdErrorType.pass ||
              type.value == PwdErrorType.none,
          prefixIcon: _pwdPrefix(type: type.value),
          prefixHeight: 24,
          focusNode: _confirmFocusNode,
          keyboardInputType: TextInputType.text,
          inputFormat: [_regex.numberEnglishSpecialFormatter],
          maxLength: null,
          onTap: () {
            _confirmFocusNode.requestFocus();
          },
          suffixHeight: 24,
          isObscure: _controller.confirmPwdObscure.value,
          suffixIcon: pwdConfirmValue.value.isNotEmpty
              ? _obscure(isNewPwd: false)
              : const SizedBox.shrink(),
          errorWidget:
              type.value == PwdErrorType.pass || type.value == PwdErrorType.none
                  ? const SizedBox.shrink()
                  : _pwdConfirmErrorText(),
          onSubmitted: (value) {
            _move();
          },
        );
      }),
    );
  }

  Widget _pwdConfirmErrorText() {
    if (_controller.confirmPwd.value.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(
          'common_textfiled_error_confirmNewPwd'.tr,
          style: _errorStyle,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(
          'common_textfield_label_confirmNewPwd'.tr,
          style: _errorStyle,
        ),
      );
    }
  }

  ///
  /// Common
  ///
  Widget _obscure({bool isNewPwd = true}) {
    return GestureDetector(
      onTap: () {
        if (isNewPwd) {
          _controller.newPwdObscure.value = !_controller.newPwdObscure.value;
        } else {
          _controller.confirmPwdObscure.value =
              !_controller.confirmPwdObscure.value;
        }
      },
      child: Obx(() {
        RxBool obscure = false.obs;
        if (isNewPwd) {
          obscure = _controller.newPwdObscure;
        } else {
          obscure = _controller.confirmPwdObscure;
        }
        return Resource.icon('ic_obscure_${obscure.value ? 'close' : 'open'}',
            width: 24, height: 24);
      }),
    );
  }

  Widget _pwdPrefix({PwdErrorType type = PwdErrorType.none}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Resource.icon('ic_pwd',
          colorFilter: ColorFilter.mode(type.iconColor, BlendMode.srcIn),
          width: 24,
          height: 24),
    );
  }

  void _move() {
    _controller.changePwd();
  }
}
