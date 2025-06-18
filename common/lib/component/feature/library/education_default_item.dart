import 'package:common/component/common/dp_strong_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

import 'package:api/api.dart';

class EducationDefaultItem extends StatelessWidget {
  final EducationDescItemModel data;
  final TextStyle titleStyle;
  final TextStyle contentsStyle;
  final TextStyle strongStyle;
  final TextStyle weekStyle;

  EducationDefaultItem({super.key,
    required this.data,
    required this.titleStyle,
    required this.contentsStyle,
    required this.strongStyle,
    required this.weekStyle});

  final ScreenUtil _screenUtil = ScreenUtil();

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
          DpStrongText(
            textList: data.contents,
            strongList: data.strong.isNotEmpty ? data.strong : [data.week],
            defaultStyle: contentsStyle,
            strongStyle: data.week.isNotEmpty ? weekStyle : strongStyle,
          )
        ],
      ),
    );
  }
}
