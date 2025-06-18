import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../reward/common/reward_simple_item.dart';
import 'package:api/api.dart';

class MyPageRewardContainer extends StatelessWidget {
  List<RewardModel> dataList;

  MyPageRewardContainer({super.key, required this.dataList});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);
  final PrefUtil spUtil = PrefUtil();
  late final double _spacing = (_screenUtil.width - 76) / 3 - 84;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: DColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _header(),
          if (dataList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: _screenUtil.width,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: _spacing >= 0 ? _spacing : 24,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 24,
                  children: List.generate(dataList.length, (idx) {
                    return RewardSimpleItem(data: dataList[idx]);
                  }),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _header() {
    return GestureDetector(
      onTap: () {
        if (spUtil.rewardOnboarding) {
          Get.toNamed(Routes.rewardMainPage);
        } else {
          Get.toNamed(Routes.rewardOnboardingPage);
        }
      },
      child: Container(
        width: _screenUtil.width,
        color: DColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'myPageMain_grid_title'.tr,
              style: _titleStyle,
            ),
            Resource.icon('ic_arrow_right_small_blue',
                colorFilter: const ColorFilter.mode(
                    DColors.labelNormalColor, BlendMode.srcIn),
                width: 24,
                height: 24)
          ],
        ),
      ),
    );
  }
}
