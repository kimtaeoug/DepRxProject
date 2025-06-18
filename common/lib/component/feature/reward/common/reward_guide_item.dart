import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class RewardGuideItem extends StatelessWidget {
  RewardGuideItem({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle = DpTextStyle.detail1.style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(horizontal: 24.5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius8, color: DColors.bgBlueColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _screenUtil.svgIcon('$ICON_PATH/ic_noti.svg'),
          const SizedBox(
            width: 8,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'stampRewardReceive_banner_title_prefix'.tr,
                style: _textStyle.copyWith(color: DColors.primaryNormalColor)),
            TextSpan(
                text: 'stampRewardReceive_banner_title_suffix'.tr,
                style:
                    _textStyle.copyWith(color: DColors.labelAlternativeColor2))
          ]))
        ],
      ),
    );
  }
}
