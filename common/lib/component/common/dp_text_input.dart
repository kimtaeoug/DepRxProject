import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:resource/resource_manager.dart';

class DpTextInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onChanged;
  final String? hintText;
  final String? label;
  final bool isError;
  final String? errorText;
  final bool isObscure;
  final Function(String)? onSubmitted;
  final int? minLength;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardInputType;
  final bool enabled;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Widget? prefixIcon;
  final double? prefixHeight;
  final Widget? suffixIcon;
  final double? suffixHeight;
  final Color? containerColor;
  final Color? containerBorderColor;
  final Widget? errorWidget;
  final EdgeInsets? containerPadding;
  final Color? cursorColor;

  DpTextInput(
      {super.key,
      required this.controller,
      required this.onChanged,
      this.hintText,
      this.label,
      this.isError = false,
      this.errorText,
      this.isObscure = false,
      this.onSubmitted,
      this.minLength,
      this.maxLength,
      this.inputFormat,
      this.keyboardInputType,
      this.enabled = true,
      this.focusNode,
      this.onTap,
      this.prefixIcon,
      this.prefixHeight,
      this.suffixIcon,
      this.suffixHeight,
      this.containerColor = DColors.white,
      this.containerBorderColor = DColors.white,
      this.errorWidget,
      this.containerPadding,
      this.cursorColor});

  final TextStyle _labelStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.black);
  final TextStyle _hintStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.inInactiveColor2);
  final TextStyle _valueStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.black, decoration: TextDecoration.none, decorationThickness: 0);
  final TextStyle _errorStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.warningAccentColor);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Text(
                label ?? '',
                style: _labelStyle,
              ),
            ),
          Container(
            width: _screenUtil.width,
            height: 52,
            decoration: const BoxDecoration(
                color: DColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Container(
              width: _screenUtil.width,
              padding: containerPadding ??
                  _screenUtil.h16v12,
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: _screenUtil.radius8,
                  border:
                      Border.all(color: containerBorderColor ?? DColors.white)),
              child: TextField(
                onTap: onTap,
                focusNode: focusNode,
                enabled: enabled,
                keyboardType: keyboardInputType,
                maxLength: maxLength,
                cursorColor: cursorColor ?? DColors.labelNormalColor,
                textInputAction: TextInputAction.go,
                onSubmitted: onSubmitted,
                controller: controller,
                onChanged: onChanged,
                obscureText: isObscure,
                style: _valueStyle,
                inputFormatters: inputFormat,
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
                    prefixIcon: prefixIcon,
                    prefixIconConstraints: prefixHeight != null
                        ? BoxConstraints(
                            minHeight: prefixHeight ?? 0,
                            maxHeight: prefixHeight ?? 0)
                        : null,
                    suffixIconConstraints: suffixHeight != null
                        ? BoxConstraints(
                            minHeight: suffixHeight ?? 0,
                            maxHeight: suffixHeight ?? 0)
                        : null,
                    suffixIcon: suffixIcon),
              ),
            ),
          ),
          errorWidget ?? _errorText()
        ]);
  }

  Widget _errorText() {
    if (isError == true && errorText != null && errorText != '') {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(
          errorText ?? '',
          style: _errorStyle,
        ),
      );
    } else {
      return Container();
    }
  }
}
