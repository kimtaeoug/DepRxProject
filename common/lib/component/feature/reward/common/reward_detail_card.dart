import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../../../common/dp_network_img.dart';
import 'package:api/api.dart';

class RewardDetailCard extends StatelessWidget {
  final RewardModel? data;

  RewardDetailCard({super.key, required this.data});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _detailLabelStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNeutralColor2);
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _dateLabelStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _dateValueStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        width: _screenUtil.width,
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius20,
            color: DColors.palletBlue200Color.withValues(alpha: 0.4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: _screenUtil.radius20,
                color: DColors.white.withValues(alpha: 0.4),
              ),
              child: Text(
                UIUtil.makeAcceptText(data?.why ?? '', subFix: '축하해요!'),
                style: _detailLabelStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: DPNetworkImage(
                imgPath: data?.imagePath ?? '',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              UIUtil.makeAcceptText(data?.value ?? ''),
              style: _titleStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: _screenUtil.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'common_receiveDate'.tr,
                    style: _dateLabelStyle,
                  ),
                  Text(
                    TimeUtil.convertDateToDot(data?.date ?? ''),
                    style: _dateValueStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
