import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class DpJoinText extends StatelessWidget {
  final Function()? function;

  DpJoinText({super.key, this.function});

  final TextStyle _joinPrefixStyle = DpTextStyle.b2.style
      .copyWith(color: DColors.labelNormalColor, height: 1.7);
  final TextStyle _joinSuffixStyle = DpTextStyle.b2.style.copyWith(
      color: DColors.primaryNormalColor,
      decoration: TextDecoration.underline,
      decorationColor: DColors.primaryNormalColor,
      fontWeight: FontWeight.w700,
      height: 1.7);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${'login_infoUnderlineBtn_info'.tr}  ',
            style: _joinPrefixStyle,
          ),
          GestureDetector(
            onTap: () {
              if (function != null) {
                function?.call();
              }
            },
            child: Text(
              'login_infoUnderlineBtn_signup'.tr,
              style: _joinSuffixStyle,
            ),
          )
        ],
      ),
    );
  }
}
