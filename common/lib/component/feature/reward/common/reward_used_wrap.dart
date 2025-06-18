import 'package:flutter/cupertino.dart';

import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../../../common/dp_network_img.dart';

class RewardUsedWrap extends StatelessWidget{
  final FinalRewardModel value;
  RewardUsedWrap({super.key, required this.value});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: _screenUtil.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'finalReward_grid_title'.tr,
              style: _textStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: _screenUtil.width,
              child: Wrap(
                alignment: value.rewardList.length > 3
                    ? value.rewardList.length > 4
                    ? WrapAlignment.start
                    : WrapAlignment.spaceBetween
                    : WrapAlignment.start,
                spacing: value.rewardList.length > 3
                    ? value.rewardList.length > 4
                    ? 20
                    : 0
                    : 20,
                runSpacing: 12,
                children: List.generate(
                    value.rewardList.length, (idx) {
                  return _imgItem(
                      value.rewardList[idx].imagePath);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imgItem(String imPath) {
    return SizedBox(
      width: (_screenUtil.width - 108) / 4,
      child: DPNetworkImage(
        imgPath: imPath,
        width: (_screenUtil.width - 108) / 4,
      ),
    );
  }

}