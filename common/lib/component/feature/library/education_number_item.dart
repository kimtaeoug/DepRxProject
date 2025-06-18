import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';
class EducationNumberItem extends StatelessWidget {
  final EducationDescItemModel data;
  final TextStyle titleStyle;
  final TextStyle contentsStyle;
  final TextStyle strongStyle;
  final TextStyle weekStyle;

  EducationNumberItem(
      {super.key,
      required this.data,
      required this.titleStyle,
      required this.contentsStyle,
      required this.strongStyle,
      required this.weekStyle});

  final ScreenUtil _screenUtil = ScreenUtil();

  final TextStyle _numberStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.primaryNormalColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: _screenUtil.width,
            child: Text(
              data.title,
              style: titleStyle,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(data.contents.length, (idx) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _numberItem(idx + 1, data.contents[idx],
                    weekText: data.week != ''
                        ? data.contents[idx].contains(data.week)
                            ? data.week
                            : null
                        : null),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _numberItem(int idx, String text, {String? weekText}) {
    return SizedBox(
      width: _screenUtil.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: DColors.bgBlueColor),
              child: Center(
                child: Text(
                  idx.toString(),
                  style: _numberStyle,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: weekText != null
                  ? _weekText(text, weekText)
                  : Text(
                      text,
                      style: contentsStyle,
                    ))
        ],
      ),
    );
  }

  Widget _weekText(String text, String week) {
    return Text.rich(TextSpan(style: contentsStyle, children: [
      TextSpan(text: text.replaceAll(week, '')),
      TextSpan(text: week, style: weekStyle)
    ]));
  }
}
