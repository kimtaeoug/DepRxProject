import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DPbutton extends StatelessWidget {
  final String text;
  final Function() function;
  bool isEnabled;
  final Widget? widget;
  final List<BoxShadow>? boxShadow;
  final bool needMargin;

  DPbutton({super.key,
    required this.text,
    required this.function,
    this.isEnabled = true,
    this.widget,
    this.boxShadow,
    this.needMargin = true});

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
        width: _screenUtil.width,
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: needMargin ? _screenUtil.defaultHorizontalMargin : EdgeInsets
            .zero,
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius8,
            color: isEnabled
                ? DColors.primaryNormalColor
                : DColors.labelAssistiveColor2,
            boxShadow: boxShadow
        ),
        child: Center(
          child: widget ??
              Text(
                text,
                style: _textStyle,
              ),
        ),
      ),
    );
  }
}
