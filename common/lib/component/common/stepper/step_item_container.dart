import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import '../dp_network_img.dart';

class StepItemContainer extends StatelessWidget {
  final String imgPath;
  final String value;
  final int week;
  final String date;

  StepItemContainer(
      {super.key,
      required this.imgPath,
      required this.value,
      required this.week,
      required this.date});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _weekStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _dateStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.primaryNormalColor);
  final TextStyle _titleStyle = DpTextStyle.b3.style
      .copyWith(height: 1.41, fontSize: 17, color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: 56,
      color: DColors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 3, bottom: 3),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: DColors.white.withOpacity(0.5)),
                  ),
                  Center(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: DColors.palletBlue200Color,
                      ),
                      child: SizedBox(
                        width: 28,
                        height: 28,
                        child: DPNetworkImage(
                            imgPath: imgPath, width: 28, height: 28),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: _screenUtil.width - 154,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: DColors.labelAlternativeColor2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              color: DColors.white.withOpacity(0.9),
                              border:
                                  Border.all(color: DColors.white, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            '$week ${'common_week'.tr}',
                            style: _weekStyle,
                          ),
                        ),
                      ),
                      Text(
                        TimeUtil.convertDateToDot(date),
                        style: _dateStyle,
                      )
                    ],
                  ),
                ),
                Text(
                  UIUtil.makeAcceptText(value),
                  style: _titleStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
