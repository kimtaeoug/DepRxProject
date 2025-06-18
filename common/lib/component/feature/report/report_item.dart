import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class ReportItem extends StatelessWidget {
  final String label;
  final int value;

  ReportItem({super.key, required this.label, required this.value});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _weekStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _labelStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: DColors.white,
          boxShadow: [
            BoxShadow(
              color: DColors.black.withValues(alpha: 0.5),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: _weekStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'common_progress'.tr,
                    style: _labelStyle,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 120,
                    height: 8,
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 8,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: DColors.lineNormalColor),
                        ),
                        AnimatedContainer(
                            width: (value / 100) * 120,
                            height: 8,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: DColors.primaryNormalColor),
                            duration: const Duration(milliseconds: 300))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Resource.icon('ic_arrow_right_small_blue',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                  DColors.labelNormalColor, BlendMode.srcIn))
        ],
      ),
    );
  }
}
