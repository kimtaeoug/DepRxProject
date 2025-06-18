import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class EmptyDiary extends StatelessWidget {
  EmptyDiary({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle = DpTextStyle.b1.style
      .copyWith(color: DColors.labelNeutralColor2, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: _screenUtil.defaultHorizontalMargin,
      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Resource.icon('ic_exclamation_mark', width: 24, height: 24),
          const SizedBox(
            height: 12,
          ),
          Text(
            '기록이 없어요!',
            style: _textStyle,
          )
        ],
      ),
    );
  }
}
