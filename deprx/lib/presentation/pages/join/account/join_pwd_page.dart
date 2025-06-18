import 'package:common/common.dart';
import 'package:deprx/presentation/controllers/join/join_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class JoinPwdPage extends StatefulWidget {
  JoinPwdPage({super.key});

  @override
  State<StatefulWidget> createState() => _JoinPwdPage();
}

class _JoinPwdPage extends State<JoinPwdPage> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Regex _regex = Regex();
  final JoinController controller = Get.find();

  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdConfirmController = TextEditingController();
  final FocusNode _pwdFocusNode = FocusNode();
  final FocusNode _pwdConfirmFocusNode = FocusNode();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.signupPwd);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pwdFocusNode.requestFocus();
      if (controller.pwdValue.value.isNotEmpty) {
        _pwdController.text = controller.pwdValue.value;
      }
      if (controller.pwdConfirmValue.value.isNotEmpty) {
        _pwdConfirmController.text = controller.pwdConfirmValue.value;
      }
    });
  }

  @override
  void dispose() {
    _pwdController.dispose();
    _pwdConfirmController.dispose();
    _pwdFocusNode.dispose();
    _pwdConfirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.bgAlternativeColor,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackAppBar(isDeprx: true,),
                  DpTitle(
                    title: 'signupPwd_overview_title'.tr,
                    strongTitle: 'signupPwd_overview_titleStrong'.tr,
                    strongTitleColor: DColors.primaryNormalColor,
                  ),
                  _pwdContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                  _pwdConfirmContainer(),
                  const SizedBox(
                    height: 30,
                  ),
                  _joinBtn()
                ],
              ),
            ),
          ),
        ));
  }

  final TextStyle _errorDefaultStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);

  ///
  /// Pwd
  ///
  Widget _pwdContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> type = controller.pwdErrorType;
        RxString pwdValue = controller.pwdValue;
        bool notError =
            type.value == PwdErrorType.none || type.value == PwdErrorType.pass;
        return DpTextInput(
          controller: _pwdController,
          onChanged: (value) {
            if (value != null) {
              controller.pwdValue.value = value.toLowerCase();
              controller.checkPwdValid(value, _regex);
            }
          },
          label: 'common_textfield_label_pwd'.tr,
          hintText: 'common_textfield_hint_pwd'.tr,
          prefixIcon: _pwdPrefix(type: type.value),
          isError: !notError,
          prefixHeight: 24,
          focusNode: _pwdFocusNode,
          keyboardInputType: TextInputType.text,
          inputFormat: [_regex.numberEnglishSpecialFormatter],
          maxLength: null,
          onTap: () {
            _pwdFocusNode.requestFocus();
          },
          suffixHeight: 24,
          isObscure: controller.pwdObscure.value,
          suffixIcon: pwdValue.value.isNotEmpty
              ? _obscureIcon()
              : const SizedBox.shrink(),
          errorWidget: _showPwdCondition(notError)
              ? _pwdErrorText()
              : const SizedBox.shrink(),
          onSubmitted: (value) {
            _pwdConfirmFocusNode.requestFocus();
          },
        );
      }),
    );
  }

  bool _showPwdCondition(bool notError) =>
      !notError && controller.pwdValue.value.isNotEmpty;

  Widget _pwdErrorText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '${'common_textfield_error_pwd1'.tr}, ',
            style: !(_regex.checkLength(controller.pwdValue.value,
                    min: 8, max: 16))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id2'.tr}, ',
            style: !_regex.hasEn(controller.pwdValue.value)
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_pwd2'.tr}, ',
            style: !(_regex.hasNumber(controller.pwdValue.value))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: 'common_textfield_error_pwd3'.tr,
            style: !(_regex.hasSpecialCharacter(controller.pwdValue.value))
                ? _errorStyle
                : _errorDefaultStyle),
      ])),
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

  Widget _obscureIcon({bool isConfirm = false}) {
    return GestureDetector(
      onTap: () {
        if (isConfirm) {
          controller.pwdConfirmObscure.value =
              !controller.pwdConfirmObscure.value;
        } else {
          controller.pwdObscure.value = !controller.pwdObscure.value;
        }
      },
      child: Obx(() {
        RxBool obscure = controller.pwdObscure;
        RxBool confirmObscure = controller.pwdConfirmObscure;
        return Resource.icon(
            'ic_obscure_${_isConfirmObscure(isConfirm, obscure.value, confirmObscure.value)}',
            width: 24,
            height: 24);
      }),
    );
  }

  String _isConfirmObscure(bool isConfirm, bool obscure, bool confirmObscure) {
    if (isConfirm) {
      if (confirmObscure) {
        return 'close';
      } else {
        return 'open';
      }
    } else {
      if (obscure) {
        return 'close';
      } else {
        return 'open';
      }
    }
  }

  ///
  /// PwdConfirm
  ///
  Widget _pwdConfirmContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        Rx<PwdErrorType> type = controller.pwdConfirmErrorType;
        RxString pwdConfirmValue = controller.pwdConfirmValue;
        return DpTextInput(
          controller: _pwdConfirmController,
          onChanged: (value) {
            if (value != null) {
              controller.pwdConfirmValue.value = value.toLowerCase();
              controller.checkPwdConfirmValid(value);
            }
          },
          label: 'common_textfield_label_confirmPwd'.tr,
          hintText: 'common_textfield_hint_pwd'.tr,
          isError: type.value == PwdErrorType.pass ||
              type.value == PwdErrorType.none,
          prefixIcon: _pwdPrefix(type: type.value),
          prefixHeight: 24,
          focusNode: _pwdConfirmFocusNode,
          keyboardInputType: TextInputType.text,
          inputFormat: [_regex.numberEnglishSpecialFormatter],
          maxLength: null,
          onTap: () {
            _pwdConfirmFocusNode.requestFocus();
          },
          suffixHeight: 24,
          isObscure: controller.pwdConfirmObscure.value,
          suffixIcon: pwdConfirmValue.value.isNotEmpty
              ? _obscureIcon(isConfirm: true)
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
    if (controller.pwdConfirmValue.value.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(
          'common_textfield_hint_pwd'.tr,
          style: _errorStyle,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(
          'common_textfiled_error_confirmNewPwd'.tr,
          style: _errorStyle,
        ),
      );
    }
  }

  ///
  /// Join Btn
  ///
  Widget _joinBtn() {
    return Obx(() {
      return DPbutton(
        text: 'common_ctaBtn_next'.tr,
        function: () {
          _move();
        },
        isEnabled: controller.pwdPassCondition(),
      );
    });
  }

  void _move() {
    if (controller.pwdPassCondition()) {
      UIUtil.closeKeyBoard();
      GAUtil.trackEvent(name: GAEventList.PASSWORD_INPUT_SUBMIT, params: {
        GAParameter.SUCCESS : 'true'
      });
      Get.toNamed(Routes.signUpPersonalInfo);
    }else{
      GAUtil.trackEvent(name: GAEventList.PASSWORD_INPUT_SUBMIT, params: {
        GAParameter.SUCCESS : 'false'
      });
    }
  }
}
