import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class RankingItem extends StatelessWidget {
  final int idx;
  final String text;
  final RankingGrade beforeGrade;
  final RankingGrade afterGrade;

  RankingItem(
      {super.key,
      required this.idx,
      required this.text,
      required this.beforeGrade,
      required this.afterGrade});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          color: DColors.white, borderRadius: _screenUtil.radius20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _numberCircle(),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: _contentStyle,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _gradeChip(beforeGrade),
                  _arrow(),
                  _gradeChip(afterGrade)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  final TextStyle _contentStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  final TextStyle _numberStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.white);

  Widget _numberCircle() {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: DColors.palletPurple400),
      child: Center(
        child: Text(
          idx.toString(),
          style: _numberStyle,
        ),
      ),
    );
  }

  final TextStyle _gradeStyle = DpTextStyle.detail1.style;

  Widget _gradeChip(RankingGrade grade) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: grade.color.withOpacity(0.1)),
      child: Text(
        grade.text,
        style: _gradeStyle.copyWith(color: grade.color),
      ),
    );
  }

  Widget _arrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Resource.icon('ic_arrow_right_sharp', width: 12, height: 12),
    );
  }
}
