import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class MyPageItem extends StatelessWidget {
  final String title;
  final Function() function;

  MyPageItem({super.key, required this.title, required this.function});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.b3.style.copyWith(color: DColors.labelNormalColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: DColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: _titleStyle,
            ),
            Resource.icon('ic_arrow_right_small_blue',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                    DColors.labelNormalColor, BlendMode.srcIn))
          ],
        ),
      ),
    );
  }
}
