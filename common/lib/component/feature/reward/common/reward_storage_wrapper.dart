import 'package:flutter/cupertino.dart';

import 'package:api/api.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'reward_simple_item.dart';
import 'package:core/core.dart';

class RewardStorageWrapper extends StatelessWidget {
  final int week;
  final List<RewardModel> dataList;
  final bool isDeprx;
  RewardStorageWrapper({super.key, required this.week, required this.dataList, this.isDeprx = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _weekStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.black);

  late final double _spacing =
      ((_screenUtil.width - 50) - 84 * 3) / 2 * (_screenUtil.width / 390);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _screenUtil.width,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '$week${'rewardStorage_grid_title'.tr}',
                  style: _weekStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: _screenUtil.width,
              child: Wrap(
                spacing: TabletCheckUtil.check(_screenUtil, context) ? 24 : _spacing >= 0 ? _spacing : 24,
                runSpacing:  TabletCheckUtil.check(_screenUtil, context) ? 24 : _spacing >= 0 ? _spacing : 24,
                children: List.generate(dataList.length, (idx) {
                  return RewardSimpleItem(data: dataList[idx], isDeprx: isDeprx, fromStorage : isDeprx);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
