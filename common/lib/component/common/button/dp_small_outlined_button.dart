import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DPSmallOutlinedButton extends StatelessWidget {
  final String text;
  final Function() function;
  final OutlineButtonType buttonType;
  final double? width;
  DPSmallOutlinedButton(
      {Key? key, required this.text, required this.function, this.buttonType = OutlineButtonType
          .blue, this.width}) : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          function.call();
        },
        child: Container(
          width: width ?? (_screenUtil.width-54)/2,
          padding: const EdgeInsets.symmetric(vertical: 14),
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
