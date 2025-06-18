import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class FindPwdIdFrame extends StatefulWidget {
  final Function() moveFunction;
  final Function() clearFindPwd;
  final String pwdId;
  final IdErrorType pwdIdErrorType;
  final Function(String?, Regex) checkPwdIdValid;
  final Function(String) setPwdId;
  final bool Function() pwdIdPassCondition;
  final Function(Function()) checkIdInFindPwd;

  const FindPwdIdFrame(
      {super.key,
      required this.moveFunction,
      required this.clearFindPwd,
      required this.pwdId,
      required this.pwdIdErrorType,
      required this.checkIdInFindPwd,
      required this.setPwdId,
      required this.pwdIdPassCondition,
      required this.checkPwdIdValid});

  @override
  State<StatefulWidget> createState() => _FindPwdIdFrame();
}

class _FindPwdIdFrame extends State<FindPwdIdFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final Regex _regex = Regex();

  final TextEditingController _idController = TextEditingController();
  final FocusNode _idFocusNode = FocusNode();

  @override
  void initState() {
    widget.clearFindPwd();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _idFocusNode.requestFocus();
      if (widget.pwdId.isNotEmpty) {
        _idController.text = widget.pwdId;
      }
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _idFocusNode.dispose();
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
        children: [
          DpTitle(
            title: 'common_overview_title_enterId'.tr,
          ),
          _idContainer(),
          const SizedBox(
            height: 30,
          ),
          _joinBtn()
        ],
      ),
    );
  }

  ///
  /// Id
  ///
  Widget _idContainer() {
    bool notError = widget.pwdIdErrorType == IdErrorType.none ||
        widget.pwdIdErrorType == IdErrorType.pass;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DpTextInput(
        controller: _idController,
        onChanged: (value) {
          widget.checkPwdIdValid(value, _regex);
          if (value != null) {
            widget.setPwdId(value.toLowerCase());
          }
        },
        hintText: 'common_textfield_hint_id'.tr,
        prefixIcon: _idPrefix(type: widget.pwdIdErrorType),
        isError: !notError,
        prefixHeight: 24,
        focusNode: _idFocusNode,
        keyboardInputType: TextInputType.text,
        inputFormat: [
          FilteringTextInputFormatter.allow(_regex.numberEnglishRegex)
        ],
        maxLength: null,
        onTap: () {
          _idFocusNode.requestFocus();
        },
        errorWidget: _idErrorShowCondition(notError)
            ? _idErrorText()
            : const SizedBox.shrink(),
        onSubmitted: (value) {
          _move();
        },
      ),
    );
  }

  bool _idErrorShowCondition(bool notError) =>
      !notError && widget.pwdId.isNotEmpty;

  final TextStyle _errorDefaultStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);

  Widget _idErrorText() {
    String pwdId = widget.pwdId;
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '${'common_textfield_error_pwd1'.tr}, ',
            style: !(_regex.checkLength(pwdId, min: 6, max: 12))
                ? _errorStyle
                : _errorDefaultStyle),
        TextSpan(
            text: '${'common_textfield_error_id2'.tr}, ',
            style: !_regex.hasEn(pwdId) ? _errorStyle : _errorDefaultStyle),
        TextSpan(
            text: 'common_textfield_error_id3'.tr,
            style:
                !(_regex.hasNumber(pwdId)) ? _errorStyle : _errorDefaultStyle)
      ])),
    );
  }

  Widget _idPrefix({IdErrorType type = IdErrorType.none}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Resource.icon('ic_id',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(type.iconColor, BlendMode.srcIn)),
    );
  }

  ///
  /// Join Btn
  ///
  Widget _joinBtn() {
    return DPbutton(
      text: 'common_ctaBtn_next'.tr,
      function: () {
        _move();
      },
      isEnabled: widget.pwdIdPassCondition(),
    );
  }

  void _move() {
    if (widget.pwdIdPassCondition()) {
      widget.checkIdInFindPwd(() {
        UIUtil.closeKeyBoard();
        widget.moveFunction();
      });
    }
  }
}
