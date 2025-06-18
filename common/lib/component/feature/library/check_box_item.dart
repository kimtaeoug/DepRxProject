import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class CheckBoxItem extends StatelessWidget {
  final bool isCheck;

  CheckBoxItem({super.key, this.isCheck = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _screenUtil.defaultHorizontalMargin,
      child: Container(
        width: _screenUtil.width,
        padding: _screenUtil.h16v12,
        decoration: BoxDecoration(
            color: DColors.white,
            borderRadius: _screenUtil.radius12,
            border: Border.all(color: DColors.white),
            boxShadow: _screenUtil.blue10Shadow()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Resource.icon('ic_check_only_enable',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    isCheck
                        ? DColors.primaryNormalColor
                        : DColors.inInactiveColor2,
                    BlendMode.srcIn)),
            const SizedBox(
              width: 12,
            ),
            Text(
              'education_checkbox'.tr,
              style: _textStyle,
            )
          ],
        ),
      ),
    );
  }
}
