import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class DPExceptionPage extends StatelessWidget {
  final Function()? function = Get.arguments?['function'] as Function()?;

  DPExceptionPage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'errorMain_overview_title'.tr;
  final String _subTitle = 'errorMain_overview_subTitle'.tr;
  final TextStyle _titleStyle =
      DpTextStyle.h3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: _screenUtil.topPadding + 67),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Resource.icon('ic_alert', width: 60, height: 60),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: _screenUtil.width,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _title,
                              style: _titleStyle,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              _subTitle,
                              style: _subTitleStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 53),
                  child: DPbutton(
                      text: 'errorMain_ctaBtn_retry'.tr,
                      function: () {
                        if (function != null) {
                          function?.call();
                        } else {}
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
