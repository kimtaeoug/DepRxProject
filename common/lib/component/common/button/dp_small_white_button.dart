import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DPSmallWhiteButton extends StatelessWidget {
  final String text;
  final Function() function;
  final double? width;

  DPSmallWhiteButton(
      {super.key, required this.text, required this.function, this.width});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
  DpTextStyle.b1.style.copyWith(color: DColors.black);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function.call();
      },
      child: Container(
        width: width ??
            (TabletCheckUtil.check(_screenUtil, context) ? (129 / 390 *
                _screenUtil.width) * 1.2 : (43 * _screenUtil.width) / 130),
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.white,
            boxShadow: [
              BoxShadow(
                  color: DColors.black.withOpacity(0.05),
                  blurRadius: 0.05,
                  spreadRadius: 1)
            ]),
        child: Center(
          child: DefaultTextStyle(style: _textStyle, child: Text(text)),
        ),
      ),
    );
  }
}
