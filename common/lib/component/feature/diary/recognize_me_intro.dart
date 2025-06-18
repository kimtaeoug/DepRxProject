import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class RecognizeMeIntro extends StatelessWidget {
  final int week;
  final String contents;

  RecognizeMeIntro({super.key, required this.week, required this.contents});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _weekStyle = DpTextStyle.h6.style.copyWith(
      color: DColors.labelAlternativeColor2, fontWeight: FontWeight.w700);
  final TextStyle _titleStyle = DpTextStyle.h4.style
      .copyWith(color: DColors.labelNormalColor, fontWeight: FontWeight.w700);
  final TextStyle _contentStyle = DpTextStyle.h3.style.copyWith(
      color: DColors.palletPurple500Color, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '벌써 $week주차에요!',
          style: _weekStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '이번주 주제는?',
          style: _titleStyle,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              borderRadius: _screenUtil.radius8,
              color: DColors.palletPuple50Color),
          child: Text(
            contents,
            style: _contentStyle,
          ),
        ),
        Resource.diaryImage('ic_recog', width: 100, height: 100)
      ],
    );
  }
}
