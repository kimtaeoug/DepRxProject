import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import '../../../common/button/dp_button.dart';

class FindIdResultFrame extends StatelessWidget {
  final Function() moveFunction;
  final String findIdResult;

  FindIdResultFrame({super.key, required this.moveFunction, required this.findIdResult});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle = DpTextStyle.h4.style
      .copyWith(color: DColors.black, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      color: DColors.bgLightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _screenUtil.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(TextSpan(children: [
                TextSpan(text: '${'findIdComplete_overview_title_prefix'.tr}\n', style: _textStyle),
                TextSpan(
                    text: findIdResult == ''
                        ? '3894ufnj***'
                        : findIdResult,
                    style: _textStyle.copyWith(
                        color: DColors.primaryNormalColor)),
                TextSpan(text: 'findIdComplete_overview_title_suffix'.tr, style: _textStyle)
              ])),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DPbutton(
              text: 'common_ctaBtn_confirm'.tr,
              function: () {
                moveFunction();
              })
        ],
      ),
    );
  }
}
