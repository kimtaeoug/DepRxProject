import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import '../../common/dp_toggle.dart';

class MarketingItem extends StatelessWidget {
  final Function() function;
  final bool isLeft;

  MarketingItem({super.key, required this.function, this.isLeft = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'myPageMain_arrowCell_marketingAgreement'.tr,
            style: _titleStyle,
          ),
          DPToggle(
            function: function,
            isLeft: isLeft,
          ),
        ],
      ),
    );
  }
}
