import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DPOutlinedButton extends StatelessWidget {
  final String text;
  final Function() function;
  final OutlineButtonType buttonType;
  final bool needMargin;
  DPOutlinedButton(
      {Key? key, required this.text, required this.function, this.buttonType = OutlineButtonType
          .blue, this.needMargin = true}) : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          function.call();
        },
        child: Container(
          width: _screenUtil.width,
          padding: const EdgeInsets.symmetric(vertical: 14),
          margin: needMargin ? _screenUtil.defaultHorizontalMargin : EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: _screenUtil.radius8,
              color: DColors.white,
              border: Border.all(
                  color: buttonType.color
              )
          ),
          child: Center(
            child: Text(
              text, style: DpTextStyle.h6.style.copyWith(color: buttonType.color),
            ),
          ),
        )
    );
  }
}
