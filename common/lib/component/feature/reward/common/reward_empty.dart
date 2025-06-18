import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class RewardEmpty extends StatelessWidget {
  RewardEmpty({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelAlternativeColor3);
  final String _contents = 'common_yetEmptyReward'.tr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150 + _screenUtil.topPadding,
          ),
          Resource.image('main_motion_007', width: 120, height: 120),
          const SizedBox(
            height: 20,
          ),
          Text(
            _contents,
            style: _textStyle,
          )
        ],
      ),
    );
  }
}
