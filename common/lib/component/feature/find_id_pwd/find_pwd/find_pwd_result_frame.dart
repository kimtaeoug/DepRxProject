import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/membership/obscure_button.dart';

class FindPwdResultFrame extends StatefulWidget {
  final Function() moveFunction;
  final Function() clearFindPwd;
  final bool Function() changePwdPassCondition;
  final PwdErrorType newPwdType;
  final Function(String) setNewPwd;
  final Function(String, Regex) checkNewPwdValid;
  final bool newPwdObscure;
  final bool confirmPwdObscure;
  final String newPwd;
  final PwdErrorType confirmPwdErrorType;
  final Function(String) setConfirmPwd;
  final Function(String) checkPwdConfirmValid;
  final String confirmPwd;
  final Function(bool) setNewPwdObscure;
  final Function(bool) setConfirmPwdObscure;
  final Function(Function()) findPwd;
  final bool isDepRx;

  const FindPwdResultFrame(
      {super.key,
      required this.moveFunction,
      required this.clearFindPwd,
      required this.changePwdPassCondition,
      required this.newPwdType,
      required this.setNewPwd,
      required this.checkNewPwdValid,
      required this.newPwdObscure,
      required this.confirmPwdObscure,
      required this.newPwd,
      required this.confirmPwdErrorType,
      required this.setConfirmPwd,
      required this.checkPwdConfirmValid,
      required this.confirmPwd,
      required this.setNewPwdObscure,
      required this.setConfirmPwdObscure,
      required this.findPwd,
      this.isDepRx = false});

  @override
  State<StatefulWidget> createState() => _FindPwdResultFrame();
}

class _FindPwdResultFrame extends State<FindPwdResultFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Regex _regex = Regex();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();

  final FocusNode _newPwdFocusNode = FocusNode();
  final FocusNode _confirmFocusNode = FocusNode();

  @override
  void initState() {
    widget.clearFindPwd();
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
    return Container(
      width: _screenUtil.width,
      color: DColors.bgLightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
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
          DPbutton(
            text: 'common_ctaBtn_applyChange'.tr,
            function: () {
              if(widget.isDepRx){
                GAUtil.trackEvent(name: GAEventList.PASSWORD_RESET_SUBMIT, params: {
                  GAParameter.SUCCESS : 'true'
                });
              }
              _move();
            },
            isEnabled: widget.changePwdPassCondition(),
          )
        ],
      ),
    );
  }

  final TextStyle _errorDefaultStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);

  ///
  /// 새 비밀번호
  ///
  Widget _newPwdContainer() {
    bool notError = widget.newPwdType == PwdErrorType.none ||
        widget.newPwdType == PwdErrorType.pass;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _newPwdController,
        onChanged: (value) {
          if (value != null) {
            widget.setNewPwd(value.toLowerCase());
            widget.checkNewPwdValid(value, _regex);
          }
        },
        onTap: () {
          _newPwdFocusNode.requestFocus();
        },
        onSubmitted: (value) {
          _confirmFocusNode.requestFocus();
        },
        focusNode: _newPwdFocusNode,
        isObscure: widget.newPwdObscure,
        label: 'common_textfield_label_newPwd'.tr,
        hintText: 'common_textfield_hint_newPwd'.tr,
        suffixHeight: 24,
        suffixIcon:
            widget.newPwd.isNotEmpty ? _obscure() : const SizedBox.shrink(),
        prefixHeight: 24,
        prefixIcon: _pwdPrefix(type: widget.newPwdType),
        maxLength: null,
        inputFormat: [_regex.numberEnglishSpecialFormatter],
        errorWidget: _showNewPwdCondition(notError)
            ? _newPwdErrorText()
            : const SizedBox.shrink(),
      ),
    );
  }

  bool _showNewPwdCondition(bool notError) =>
      !notError && widget.newPwd.isNotEmpty;

  Widget _newPwdErrorText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '${'common_textfield_error_pwd1'.tr}, ',
            style: !(_regex.checkLength(widget.newPwd, min: 6, max: 12))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id2'.tr}, ',
            style: !_regex.hasEn(widget.newPwd)
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_pwd2'.tr}, ',
            style: !(_regex.hasNumber(widget.newPwd))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: 'common_textfield_error_pwd3'.tr,
            style: !(_regex.hasSpecialCharacter(widget.newPwd))
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
      child: DpTextInput(
        controller: _confirmPwdController,
        onChanged: (value) {
          if (value != null) {
            widget.setConfirmPwd(value.toLowerCase());
            widget.checkPwdConfirmValid(value);
          }
        },
        label: 'common_textfield_label_confirmNewPwd'.tr,
        hintText: 'common_textfield_hint_pwd'.tr,
        isError: !(widget.confirmPwdErrorType == PwdErrorType.pass ||
            widget.confirmPwdErrorType == PwdErrorType.none),
        prefixIcon: _pwdPrefix(type: widget.confirmPwdErrorType),
        prefixHeight: 24,
        focusNode: _confirmFocusNode,
        keyboardInputType: TextInputType.text,
        inputFormat: [_regex.numberEnglishSpecialFormatter],
        maxLength: null,
        onTap: () {
          _confirmFocusNode.requestFocus();
        },
        suffixHeight: 24,
        isObscure: widget.confirmPwdObscure,
        suffixIcon: widget.confirmPwd.isNotEmpty
            ? _obscure(isNewPwd: false)
            : const SizedBox.shrink(),
        errorWidget: widget.confirmPwdErrorType == PwdErrorType.pass ||
                widget.confirmPwdErrorType == PwdErrorType.none
            ? const SizedBox.shrink()
            : _pwdConfirmErrorText(),
        onSubmitted: (value) {
          _move();
        },
      ),
    );
  }

  Widget _pwdConfirmErrorText() {
    if (widget.confirmPwd.isNotEmpty) {
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
    bool obscure = isNewPwd ? widget.newPwdObscure : widget.confirmPwdObscure;
    return ObscureButton(
        function: () {
          if (isNewPwd) {
            widget.setNewPwdObscure(!widget.newPwdObscure);
          } else {
            widget.setConfirmPwdObscure(!widget.confirmPwdObscure);
          }
        },
        obscure: obscure);
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

  void _move() {
    if (widget.changePwdPassCondition()) {
      widget.findPwd(() {
        widget.moveFunction();
      });
    }
  }
}
