import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class KbadsEmptyContainer extends StatelessWidget {
  KbadsEmptyContainer({super.key});

  final TextStyle _textStyle =
      DpTextStyle.b6.style.copyWith(color: DColors.labelNeutralColor2);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 26),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20, color: DColors.palettePink50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _screenUtil.svgIcon('$ICON_PATH/ic_exclamation_mark.svg'),
          const SizedBox(
            height: 12,
          ),
          Text(
            'common_emptyRating'.tr,
            style: _textStyle,
          )
        ],
      ),
    );
  }
}
