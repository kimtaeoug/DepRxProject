import 'package:common/component/common/button/dp_button.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resource/resource_manager.dart';

import '../../common/button/dp_outlined_button.dart';

class DpDiaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onChanged;
  final String? hintText;
  final String? errorText;
  final Function(String)? onSubmitted;
  final int minLength;
  final int maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final int length;
  final Function() btnFunction;
  final bool passCondition;

  DpDiaryTextField({super.key,
    required this.controller,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.onSubmitted,
    required this.minLength,
    required this.maxLength,
    this.focusNode,
    this.onTap,
    required this.length,
    required this.btnFunction,
    required this.passCondition});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _defaultStyle = DpTextStyle.b2.style.copyWith(
    fontWeight: FontWeight.w500,
    color: DColors.labelNormalColor,
  );
  late final TextStyle _hintStyle =
  _defaultStyle.copyWith(color: DColors.labelAssistiveColor2);
  late final TextStyle _countStyle =
  _defaultStyle.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _errorStyle = DpTextStyle.b5.style
      .copyWith(fontWeight: FontWeight.w600, color: DColors.negativeStatusRed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: _screenUtil.defaultHorizontalMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _screenUtil.width,
            padding: _screenUtil.defaultAllMargin,
            decoration: BoxDecoration(
                color: DColors.white,
                borderRadius: _screenUtil.radius12,
                border: Border.all(
                    color: errorText != null
                        ? DColors.negativeStatusRed
                        : DColors.transparent)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  child: TextField(
                    controller: controller,
                    onTap: onTap,
                    onSubmitted: onSubmitted,
                    maxLength: null,
                    textInputAction: TextInputAction.go,
                    onChanged: onChanged,
                    style: _defaultStyle,
                    cursorColor: DColors.primaryNormalColor,
                    maxLines: null,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      hintText: hintText,
                      hintStyle: _hintStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _count()
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              UIUtil.closeKeyBoard();
            },
            child: Container(
              width: _screenUtil.width,
              height: 50,
              color: DColors.transparent,
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 0),
                child: _error(),
              ),
            ),
          ),
          length != 0
              ? DPbutton(
            text: '저장',
            function: passCondition ? btnFunction : (){},
            isEnabled: passCondition,
            needMargin: false,)
              : DPOutlinedButton(text: '다음',
            function: passCondition ? btnFunction : (){},
            buttonType: OutlineButtonType.disabled, needMargin: false,)
        ],
      ),
    );
  }

  Widget _count() {
    if (length == 0) {
      return Text(
        '$minLength~$maxLength자',
        style: _countStyle,
      );
    } else {
      return Text(
        '$length / $maxLength자',
        style: _countStyle,
      );
    }
  }

  Widget _error() {
    if (errorText != null) {
      return SizedBox(
        width: _screenUtil.width,
        child: Text(
          errorText ?? '',
          style: _errorStyle,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
