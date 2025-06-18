import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class TryBDIContainer extends StatelessWidget {
  final String? value;
  final Function()? gaFunction;

  TryBDIContainer({super.key, this.value, this.gaFunction});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
      DpTextStyle.b6.style.copyWith(color: DColors.labelNeutralColor2);
  final String _title = 'main_reInspection_title'.tr;
  final String _subTitle = 'main_reInspection_subtitle'.tr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(gaFunction != null){
          gaFunction?.call();
        }
        Get.toNamed(Routes.bdiSelectPage, arguments: {'isFinal': true});
        return;
      },
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: DColors.bgBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Text(
                  _title,
                  style: _titleStyle,
                )),
                value != null
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                      )
                    : Resource.icon('ic_arrow_right_small_blue',
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                            DColors.labelNormalColor, BlendMode.srcIn))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: _screenUtil.width,
              child: Text(
                value != null ? (value ?? '') : _subTitle,
                style: _subTitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
