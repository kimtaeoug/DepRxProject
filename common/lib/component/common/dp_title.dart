import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DpTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? strongTitle;
  final Color? strongTitleColor;
  final String? strongSubTitle;
  final Color? strongSubTitleColor;
  final bool needPadding;
  final EdgeInsets? padding;
  final TextStyle? inputTitleStyle;
  final TextStyle? inputSubTitleStyle;

  DpTitle(
      {super.key,
      required this.title,
      this.subTitle,
      this.strongTitle,
      this.strongTitleColor,
      this.strongSubTitle,
      this.strongSubTitleColor,
      this.needPadding = true,
      this.padding,
      this.inputTitleStyle,
      this.inputSubTitleStyle});

  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor);

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding:
          needPadding ? _screenUtil.defaultAllMargin : padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _strongWidget(
              title,
              strongTitle,
              inputTitleStyle ?? _titleStyle,
              inputTitleStyle?.copyWith(
                      color: strongTitleColor ?? DColors.black) ??
                  _titleStyle.copyWith(
                      color: strongTitleColor ?? DColors.black)),
          if (subTitle != null)
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _strongWidget(
                    subTitle ?? '',
                    strongSubTitle,
                    inputSubTitleStyle ?? _subStyle,
                    inputSubTitleStyle?.copyWith(
                            color: strongSubTitleColor ?? DColors.black) ??
                        _subStyle.copyWith(
                            color: strongSubTitleColor ?? DColors.black)))
        ],
      ),
    );
  }

  Widget _strongWidget(String text, String? strong, TextStyle textStyle,
      TextStyle? strongTextStyle) {
    if (strong != null) {
      int where = textWhere(text, strong);
      switch (where) {
        case 0:
          String dummyTitle = text.replaceAll(strong, '');
          return SizedBox(
            width: _screenUtil.width,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: strong, style: strongTextStyle),
              TextSpan(text: dummyTitle, style: textStyle)
            ])),
          );
        case 1:
          List<String> dummyList = text.split(strong);
          return SizedBox(
            width: _screenUtil.width,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: dummyList[0], style: textStyle),
                TextSpan(text: strong, style: strongTextStyle),
                TextSpan(text: dummyList.last, style: textStyle)
              ]),
            ),
          );
        case 2:
          String dummyTitle = text.replaceAll(strong, '');
          return SizedBox(
            width: _screenUtil.width,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: dummyTitle, style: textStyle),
              TextSpan(text: strong, style: strongTextStyle),
            ])),
          );
        default:
          return Container();
      }
    } else {
      return SizedBox(
        width: _screenUtil.width,
        child: Text(
          text,
          style: textStyle,
        ),
      );
    }
  }

  ///
  /// 0 : start, 1 : between, 2 : end
  ///
  int textWhere(String text, String findText) {
    if (text.startsWith(findText)) {
      return 0;
    } else if (text.endsWith(findText)) {
      return 2;
    } else {
      return 1;
    }
  }
}
