import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class CurriculumItem extends StatelessWidget {
  final String week;
  final String title;
  final bool isClicked;

  CurriculumItem(
      {super.key,
      required this.week,
      required this.title,
      this.isClicked = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _labelStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.palettePurple502);
  final TextStyle _contentStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    if (isClicked) {
      return _clicked();
    } else {
      return _notClicked();
    }
  }

  Widget _clicked() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: DColors.palettePurple50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$week${'common_week'.tr}',
            style: _labelStyle,
          ),
          SizedBox(
            width: _screenUtil.width,
            child: Text(
              title,
              style: _contentStyle,
            ),
          )
        ],
      ),
    );
  }

  Widget _notClicked() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: DColors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$week${'common_week'.tr}',
            style: _labelStyle.copyWith(
                color: DColors.palettePurple502.withOpacity(0.5)),
          ),
          SizedBox(
            width: _screenUtil.width,
            child: Text(
              title,
              style: _contentStyle.copyWith(
                  color: DColors.labelNormalColor.withOpacity(0.5)),
            ),
          )
        ],
      ),
    );
  }
}
