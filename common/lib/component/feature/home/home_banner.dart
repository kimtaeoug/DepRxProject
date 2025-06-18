import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.labelNeutralColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: DColors.bgBlueColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Resource.icon('ic_noti', width: 20, height: 20),
            const SizedBox(
              width: 8,
            ),
            Text(
              'main_banner'.tr,
              style: _titleStyle,
            )
          ],
        ),
      ),
    );
  }
}
