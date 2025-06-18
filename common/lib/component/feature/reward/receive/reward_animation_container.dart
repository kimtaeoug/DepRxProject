import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';

class RewardAnimationContainer extends StatelessWidget {
  final AnimationController animationController;
  final RewardModel? data;

  RewardAnimationContainer(
      {super.key, required this.animationController, this.data});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  child: Center(
                    child: Text(
                      data != null
                          ? '${data?.week}${'weeklyRewardIntro_overview_title'.tr}'
                          : 'stampRewardIntro_overview_title'.tr,
                      style: _titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Resource.lottiAnimationWithController(
                    'stamp_gift', animationController,
                    width: 240, height: 240)
              ],
            ),
          )
        ],
      ),
    );
  }
}
