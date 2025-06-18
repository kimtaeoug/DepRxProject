import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';

class LibraryItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final int week;

  LibraryItem(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.week});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _tittleStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.palletPurpleColor);
  final TextStyle _contentStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: DColors.white.withOpacity(0.5)),
          color: DColors.white,
          boxShadow: _screenUtil.pressShadow()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Resource.image(imgPath, width: 40, height: 40),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$week${'common_week'.tr}',
                    style: _tittleStyle,
                  ),
                  SizedBox(
                    width: _screenUtil.width - 190,
                    child: Text(
                      title,
                      style: _contentStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Resource.icon('ic_arrow_right_small_blue',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                    DColors.labelNormalColor, BlendMode.srcIn)),
          )
        ],
      ),
    );
  }
}
