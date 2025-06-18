import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class RankingEmptyContainer extends StatelessWidget {
  final bool isPreffered;

  RankingEmptyContainer({super.key, this.isPreffered = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.palletPurpleColor);
  final TextStyle _contentsStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius20, color: DColors.palettePurple50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'common_ranking_title'.tr,
            style: _titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Resource.image('main_motion_007', width: 120, height: 120),
          ),
          Text(
            isPreffered
                ? 'common_ranking_empty_subTitle'.tr
                : 'common_ranking_noActivity_subTitle'.tr,
            style: _contentsStyle,
          )
        ],
      ),
    );
  }
}
