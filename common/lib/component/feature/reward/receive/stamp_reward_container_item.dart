import 'package:flutter/cupertino.dart';

import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_network_img.dart';
import '../common/reward_guide_item.dart';

class StampRewardContainerItem extends StatelessWidget {
  final RewardModel data;
  final Function() moveFunction;
  final bool isLast;

  StampRewardContainerItem(
      {super.key,
      required this.data,
      required this.moveFunction,
      this.isLast = false});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _titleStyle =
      DpTextStyle.h2.style.copyWith(color: DColors.black);
  final TextStyle _labelStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _valueStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.black);
  final TextStyle _itemStyle =
      DpTextStyle.h4.style.copyWith(color: DColors.primaryNormalColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Stack(
        children: [
          Resource.image('reward_bg',
              width: _screenUtil.width, height: _screenUtil.height),
          SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: _screenUtil.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: DPNetworkImage(
                              imgPath: data.imagePath, width: 200, height: 200),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            data.why,
                            style: _titleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.5),
                          child: Container(
                            width: _screenUtil.width,
                            height: 1,
                            color: DColors.lineNeutralColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data.label,
                                    style: _labelStyle,
                                  ),
                                  Text(
                                    data.value,
                                    style: _valueStyle,
                                  )
                                ],
                              ),
                              Text(
                                data.item,
                                style: _itemStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: RewardGuideItem(),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 53),
                  child: DPbutton(
                      text: isLast ? 'common_ctaBtn_confirm'.tr : 'stampRwardReceive_ctaBtn_next'.tr,
                      function: () {
                        moveFunction();
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
