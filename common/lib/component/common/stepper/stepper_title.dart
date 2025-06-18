import 'package:flutter/cupertino.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class StepperTitle extends StatelessWidget {
  final String title;
  final Function() function;

  StepperTitle({super.key, required this.title, required this.function});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle = DpTextStyle.h6.style.copyWith(
    color: DColors.labelNormalColor,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: _screenUtil.width,
        color: DColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: _titleStyle,
            ),
            _screenUtil.svgIcon('$ICON_PATH/ic_arrow_right_small_blue.svg',
                colorFilter: const ColorFilter.mode(
                    DColors.labelNormalColor, BlendMode.srcIn))
          ],
        ),
      ),
    );
  }
}
