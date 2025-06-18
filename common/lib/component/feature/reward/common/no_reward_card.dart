import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class NoRewardCard extends StatelessWidget {
  final String imgPath;
  final String why;

  NoRewardCard({super.key, required this.imgPath, required this.why});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _contentsStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _dateLabelStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _dateStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _notiStyle =
      DpTextStyle.b6.style.copyWith(color: DColors.primaryStrongColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _screenUtil.defaultHorizontalMargin,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: _screenUtil.radius20,
        gradient: DColors.rewardGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: _screenUtil.radius20,
                color: DColors.white.withValues(alpha: 0.4)),
            child: Text(
              'rewardFail_header'.tr,
              style: _titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: DPNetworkImage(
              imgPath: imgPath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'rewardFail_content'.tr,
            style: _contentsStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'rewardFail_why'.tr,
                style: _dateLabelStyle,
              ),
              Text(
                why,
                style: _dateStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FittedBox(
            child: Text(
              'rewardFail_info'.tr,
              style: _notiStyle,
            ),
          )
        ],
      ),
    );
  }
}
