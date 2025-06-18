import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class TodayDiaryItem extends StatelessWidget {
  final DateTime dateTime;
  final String contents;

  TodayDiaryItem({super.key, required this.dateTime, required this.contents});

  final ScreenUtil _screenUtil = ScreenUtil();
  final DiaryType type = DiaryType.td;

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
                Text(
                  '${dateTime.month}/${dateTime.day} 일기',
                  style: type.itemTitleStyle,
                ),
                Resource.diaryImage(type.icon, width: 50, height: 50)
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              child: Container(
                width: _screenUtil.width,
                decoration: type.itemContentsDecoration,
                padding: _screenUtil.defaultAllMargin,
                child: Text(
                  contents,
                  style: type.itemContentStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
