import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:api/api.dart';
import 'package:resource/resource_manager.dart';
import '../../../common/button/dp_button.dart';
import 'reward_simple_item.dart';


class RewardWeekBottomSheet extends StatefulWidget {
  final int week;
  final List<RewardModel> dataList;
  final bool isDepRx;

  RewardWeekBottomSheet(
      {super.key, required this.week, required this.dataList, this.isDepRx = false});

  @override
  State<StatefulWidget> createState() => _RewardWeekBottomSheet();
}

class _RewardWeekBottomSheet extends State<RewardWeekBottomSheet> {

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
  DpTextStyle.b1.style.copyWith(color: DColors.black);
  late final double _spacing = (_screenUtil.width - 48) / 3 - 84;

  @override
  void initState() {
    GAUtil.trackEvent(name: GAEventList.REWARD_BOTTOMSHEET_VIEW, params: {
      GAParameter.WEEK: widget.week,
      GAParameter.WEEKLY_REWARD_LIST: GAConverterUtil.convertRewardMain(
          widget.dataList)
    }, isDeprx: widget.isDepRx);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.only(top: 30, bottom: 41),
      decoration: BoxDecoration(
        color: DColors.white,
        borderRadius: _screenUtil.radius20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: _screenUtil.defaultHorizontalMargin,
              child: SizedBox(
                width: _screenUtil.width,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${widget.week}${'rewardMain_bottomSeet_title'.tr}',
                    style: _titleStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: _screenUtil.defaultHorizontalMargin,
              child: SizedBox(
                width: _screenUtil.width,
                child: Wrap(
                  spacing: _spacing >= 0 ? _spacing : 24,
                  runSpacing: 16,
                  children: List.generate(widget.dataList.length, (idx) {
                    return RewardSimpleItem(
                      data: widget.dataList[idx], isDeprx: widget.isDepRx,);
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            DPbutton(
                text: 'common_ctaBtn_confirm'.tr,
                function: () {
                  GAUtil.trackEvent(
                      name: GAEventList.REWARD_BOTTOMSHEET_CONFIRM_BUTTON_CLICK,
                      params: {
                        GAParameter.WEEK: widget.week,
                        GAParameter.WEEKLY_REWARD_LIST: GAConverterUtil
                            .convertRewardMain(
                            widget.dataList)
                      }, isDeprx: widget.isDepRx);
                  Get.back();
                })
          ],
        ),
      ),
    );
  }
}
