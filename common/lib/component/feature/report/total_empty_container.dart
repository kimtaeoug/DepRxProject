import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class ReportEmptyContainer extends StatelessWidget {
  final bool isTotal;

  ReportEmptyContainer({super.key, this.isTotal = true});

  final ScreenUtil _screenUtil = ScreenUtil();

  final String _totalText = 'common_yetEmptyReport'.tr;
  final String _detailText = 'reportDetail_toast_error_noActivity'.tr;
  final TextStyle _textStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelAlternativeColor3);
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgLightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: _screenUtil.topPadding),
            child: Container(
              width: _screenUtil.width,
              padding: const EdgeInsets.all(20),
              child: Text(
                'reportMain_overview_title'.tr,
                style: _titleStyle,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Resource.image('main_motion_007', width: 120, height: 120),
              const SizedBox(
                height: 20,
              ),
              Text(
                isTotal ? _totalText : _detailText,
                style: _textStyle,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: _screenUtil.topPadding),
            child: Container(
              width: _screenUtil.width,
              padding: const EdgeInsets.all(20),
              child: Text(
                '',
                style: _titleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
