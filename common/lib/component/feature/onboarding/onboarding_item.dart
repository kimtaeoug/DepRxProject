import 'package:core/utils/tablet_check_util.dart';
import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
import 'package:get/get.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemModel data;
  final Function() function;

  OnBoardingItem({super.key, required this.data, required this.function});

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
          Expanded(
              child: SizedBox(
            width: _screenUtil.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TabletCheckUtil.check(_screenUtil, context) ? 140 : 70),
              child: Resource.onboarding(data.imgPath,
                  width: 250, boxFit: BoxFit.fitWidth),
            ),
          ))
        ],
      ),
    );
  }
}
