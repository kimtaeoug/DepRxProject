import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class QuizContainer extends StatelessWidget {
  final String text;
  final QuizType type;

  QuizContainer({super.key, required this.text, this.type = QuizType.normal});

  final ScreenUtil _screenUtil = ScreenUtil();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: _screenUtil.defaultHorizontalMargin,
      decoration: type.decoration,
      padding: EdgeInsets.all(20),
      child: _contents(),
    );
  }

  Widget _contents() {
    switch (type) {
      case QuizType.normal:
        return Text(text, style: type.textStyle,);
      case QuizType.success:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Text(text, style: type.textStyle,)),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Resource.icon(type.imgPath),
            )
          ],
        );
      case QuizType.fail:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Text(text, style: type.textStyle,)),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Resource.icon(type.imgPath, colorFilter: ColorFilter.mode(
                  type.iconColor, BlendMode.srcIn)),
            )
          ],
        );
    }
  }

}