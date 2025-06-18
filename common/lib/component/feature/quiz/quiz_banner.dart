import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class QuizBanner extends StatelessWidget {
  final QuizType type;

  QuizBanner({super.key, this.type = QuizType.normal});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: _screenUtil.defaultHorizontalMargin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: type.bannerBgColor),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Resource.icon('ic_noti',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(type.iconColor, BlendMode.srcIn)),
          const SizedBox(
            width: 8,
          ),
          Expanded(child: Text(
            type.bannerText,
            style: type.bannerTextStyle,
          ))
        ],
      ),
    );
  }
}
