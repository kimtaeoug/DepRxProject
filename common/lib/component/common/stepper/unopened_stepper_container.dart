import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class UnOpenedStepperContainer extends StatelessWidget {
  final int week;
  final bool isFail;

  UnOpenedStepperContainer(
      {super.key, required this.week, this.isFail = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle = DpTextStyle.h6.style.copyWith(
    color: DColors.labelNormalColor,
  );
  final TextStyle _weekStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.labelAlternativeColor2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DColors.white.withValues(alpha: 0.5)),
                ),
                Center(
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: DColors.palletBlue200Color,
                    ),
                    child: Center(
                      child: _screenUtil.svgIcon('$ICON_PATH/ic_lock.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:  BoxDecoration(
                    borderRadius: _screenUtil.radius8,
                    color: DColors.labelAlternativeColor2),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: DColors.white.withValues(alpha: 0.9),
                      border: Border.all(color: DColors.white, width: 1),
                      borderRadius: _screenUtil.radius8),
                  child: Text(
                    '$week ${'common_week'.tr}',
                    style: _weekStyle,
                  ),
                ),
              ),
              Text(
                week != 10 ? 'main_rewardStepper_next'.tr : 'common_finalReward'.tr,
                style: _titleStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
