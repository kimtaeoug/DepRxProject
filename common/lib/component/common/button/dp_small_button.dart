import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DPSmallButton extends StatelessWidget {
  final String text;
  final Function() function;
  bool isEnabled;
  final double? width;
  final double? verticalPadding;
  final double? radius;
  final TextStyle? textStyle;

  DPSmallButton({super.key,
    required this.text,
    required this.function,
    this.isEnabled = true,
    this.width,
    this.verticalPadding,
    this.radius,
    this.textStyle});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
  DpTextStyle.h6.style.copyWith(color: DColors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function.call();
      },
      child: Container(
        width: width ?? (_screenUtil.width - 54) / 2,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
          color: isEnabled
              ? DColors.primaryNormalColor
              : DColors.labelAssistiveColor2,
        ),
        child: Center(
          child: DefaultTextStyle(style: _textStyle, child: Text(text)),
        ),
      ),
    );
  }
}
