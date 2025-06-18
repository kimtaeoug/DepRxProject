import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class DiaryCompleteContainer extends StatelessWidget {
  DiaryCompleteContainer({super.key});

  final TextStyle _textStyle = DpTextStyle.h4.style;
  final String _text = '기록이 완료되었습니다!';
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Resource.icon('ic_diary_complete', width: 120, height: 120),
          Padding(
            padding: EdgeInsets.only(top: 44, bottom: 20),
            child: Text(
              _text,
              style: _textStyle,
            ),
          )
        ],
      ),
    );
  }
}
