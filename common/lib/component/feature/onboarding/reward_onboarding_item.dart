import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';

class RewardOnBoardingItem extends StatelessWidget {
  final OnBoardingItemModel data;
  final Function() function;
  final int idx;

  RewardOnBoardingItem({super.key,
    required this.data,
    required this.function,
    required this.idx});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
  DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
  DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60 + _screenUtil.topPadding),
            child: Container(
              width: _screenUtil.width,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    style: _titleStyle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.contents,
                    style: _subTitleStyle,
                  )
                ],
              ),
            ),
          ),
          _contents(),
          const SizedBox(height: 110,)
        ],
      ),
    );
  }

  Widget _contents() {
    if (idx == 0) {
      return Resource.onboarding(data.imgPath,
          width: _screenUtil.width * 99 / 130, boxFit: BoxFit.fitWidth);
    } else if (idx == 1) {
      return Container(
        width: _screenUtil.width * 300 / 390,
        padding: const EdgeInsets.symmetric(horizontal: 3.68, vertical: 4.6),
        child: Resource.onboarding(data.imgPath, boxFit: BoxFit.fitWidth),
      );
    } else {
      return SizedBox(
        width: _screenUtil.width * 99 / 130,
        child: Stack(
          children: [
            Resource.onboarding('reward_onboarding_3_1',
                width: _screenUtil.width * 99 / 130, boxFit: BoxFit.fitWidth),
            Center(
              child: Resource.onboarding('reward_onboarding_3_2',
                  width: _screenUtil.width * 200 / 390,
                  boxFit: BoxFit.fitWidth),
            )
          ],
        ),
      );
    }
  }
}
