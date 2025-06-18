import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DomeInfoItem extends StatelessWidget {
  final String title;
  final String value;

  DomeInfoItem({super.key, required this.title, required this.value});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _labelStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _valueStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.5),
            child: Text(
              title,
              style: _labelStyle,
            ),
          ),
          const SizedBox(
            width: 80,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Resource.image('qr_code',
                    width: 60, height: 60, boxFit: BoxFit.contain),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  value,
                  style: _valueStyle,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
