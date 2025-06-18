import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
class CurriculumDetailItem extends StatelessWidget {
  final CurriculumItemModel data;

  CurriculumDetailItem({super.key, required this.data});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _labelStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.palettePurple502);
  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _contentStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: DColors.lineNeutralColor),
          color: DColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.weeklyTitle,
            style: _labelStyle,
          ),
          Text(
            data.goal,
            style: _titleStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(data.detail.length, (idx) {
              String item = data.detail[idx];
              return _dotContainer(item);
            }),
          )
        ],
      ),
    );
  }

  Widget _dotContainer(String input) {
    return SizedBox(
      width: _screenUtil.width - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            ' · ',
            style: _contentStyle,
          ),
          Expanded(
              child: Text(
            input,
            style: _contentStyle,
          ))
        ],
      ),
    );
  }
}
