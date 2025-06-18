import 'package:common/component/common/button/dp_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class EduContinuousFrame extends StatelessWidget {
  final int week;
  final Function() moveFunction;

  EduContinuousFrame(
      {super.key, required this.week, required this.moveFunction});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);

  late final String _title =
      '$week${'continuousEdu_overview_title_1'.tr}\n${week + 1}${'continuousEdu_overview_title_2'.tr}';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 66 + _screenUtil.topPadding),
            child: Container(
              width: _screenUtil.width,
              padding: const EdgeInsets.all(24),
              child: Text(
                _title,
                style: _titleStyle,
              ),
            ),
          ),
          Resource.image('main_motion_10', width: 200, height: 200),
          Padding(
            padding: const EdgeInsets.only(bottom: 79),
            child: DPbutton(text: 'common_ctaBtn_start'.tr, function: moveFunction),
          )
        ],
      ),
    );
  }
}
