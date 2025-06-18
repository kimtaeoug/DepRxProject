import 'package:flutter/cupertino.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class AnswerContainer extends StatelessWidget {
  final String text;
  final bool isCheck;
  final Function() function;

  AnswerContainer(
      {super.key,
      required this.text,
      this.isCheck = false,
      required this.function});

  final ScreenUtil _screenUtil = ScreenUtil();
  final double _defaultMargin = 24;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: _screenUtil.width - _defaultMargin * 2,
        margin: _screenUtil.defaultHorizontalMargin,
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.white,
            boxShadow: _screenUtil.emphasizeShadow()),
        child: Container(
          padding: _screenUtil.defaultAllMargin,
          width: _screenUtil.width - _defaultMargin * 2,
          decoration: BoxDecoration(
              borderRadius: _screenUtil.radius12,
              color: isCheck ? DColors.bgBlueColor : DColors.white,
              border: Border.all(
                  color: isCheck ? DColors.primaryNormalColor : DColors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: isCheck ? _checkStyle : _defaultStyle,
              ),
              if (isCheck) _screenUtil.svgIcon('$ICON_PATH/ic_check.svg')
            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _defaultStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _checkStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.primaryNormalColor);
}
