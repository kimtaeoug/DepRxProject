import 'package:common/component/common/dp_strong_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class VersionItem extends StatelessWidget {
  final String title;
  final String contents;
  final String value;

  VersionItem(
      {super.key,
      required this.title,
      required this.contents,
      required this.value});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _labelStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _contentsStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.labelAlternativeColor2);
  final TextStyle _valueStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: _screenUtil.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: _labelStyle,
                ),
                Text(
                  value,
                  style: _valueStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: _screenUtil.width,
            child: DpStrongText(
                textList: ['appInfo_cell_version_description'.tr],
                strongList: ['appInfo_cell_version_descriptionStrong'.tr],
                defaultStyle: _contentsStyle,
                strongStyle:
                    _contentsStyle.copyWith(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
