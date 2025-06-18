import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'dp_network_img.dart';

class RewardFinalCard extends StatelessWidget {
  final String imgPath;
  final String header;
  final String content;
  final String date;
  final String? inCompleteReason;

  RewardFinalCard(
      {super.key,
      required this.imgPath,
      required this.header,
      required this.content,
      required this.date,
      this.inCompleteReason});

  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _contentsStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _dateLabelStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _dateStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final ScreenUtil _screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _screenUtil.defaultHorizontalMargin,
      padding: const EdgeInsets.symmetric(vertical: 30),
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
              header,
              style: _titleStyle,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: DPNetworkImage(
              imgPath: imgPath,
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            style: _contentsStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'common_receiveDate'.tr,
                  style: _dateLabelStyle,
                ),
                Text(
                  TimeUtil.convertDateToDot(date),
                  style: _dateStyle,
                )
              ],
            ),
          ),
          if (inCompleteReason != null && inCompleteReason != '')
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'finalRewardFail_why',
                    style: _dateLabelStyle,
                  ),
                  Text(
                    inCompleteReason ?? '',
                    style: _dateStyle,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
