import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import '../../../common/dp_network_img.dart';

class RewardSimpleItem extends StatelessWidget {
  final RewardModel data;
  final bool isDeprx;
  final bool fromStorage;

  RewardSimpleItem(
      {super.key, required this.data, this.isDeprx = false, this.fromStorage = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _labelStyle = DpTextStyle.b5.style
      .copyWith(color: DColors.labelNormalColor, fontSize: 13);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDeprx) {
          if (fromStorage) {
            GAUtil.trackEvent(name: GAEventList.REWARD_STORAGE_ITEM_CLICK, params: {
              GAParameter.WEEK: data.week,
              GAParameter.REWARD_NAME: data.value,
              GAParameter.REWARD_REASON: data.why
            });
          } else {
            GAUtil.trackEvent(
                name: GAEventList.REWARD_ITEM_BOTTOMSHEET_CLICK, params: {
              GAParameter.WEEK: data.week,
              GAParameter.REWARD_NAME: data.value,
              GAParameter.REWARD_REASON: data.why
            });
          }
        }
        Get.toNamed(Routes.rewardDetailPage, arguments: {'data': data});
      },
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 8, left: 12, right: 12),
        decoration: BoxDecoration(
            borderRadius: _screenUtil.radius12,
            color: DColors.black.withValues(alpha: 0.02)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: DPNetworkImage(
                imgPath: data.imagePath,
                width: 60,
                height: 60,
                isCircle: false,
              ),
            ),
            SizedBox(
              width: 60,
              child: Text(
                data.why,
                style: _labelStyle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
