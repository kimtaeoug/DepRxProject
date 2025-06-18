import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class RecognizeMeItem extends StatelessWidget {
  final String title;
  final String content;

  RecognizeMeItem({super.key, required this.title, required this.content});

  final DiaryType type = DiaryType.rm;

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      child: Padding(
        padding: _screenUtil.defaultHorizontalMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child:
                      Resource.diaryImage(type.icon, width: 50, height: 50),
                ),
                Expanded(
                    child: Text(
                  title,
                  style: type.itemTitleStyle,
                ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: _screenUtil.width,
              decoration: type.itemContentsDecoration,
              padding: _screenUtil.defaultAllMargin,
              child: Text(
                content,
                style: type.itemContentStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
