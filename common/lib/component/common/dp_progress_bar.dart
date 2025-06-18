//personal_info_page.dart

import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class DPProgressBar extends StatelessWidget {
  final int value;
  final int totalLength;
  final Color? defaultColor;

  DPProgressBar({super.key,
    required this.value,
    required this.totalLength,
    this.defaultColor});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: _screenUtil.radius12,
                  color: defaultColor ?? DColors.labelDisableColor3),
              width: _screenUtil.width,
              height: 8,
            ),
            AnimatedContainer(
              width: (_screenUtil.width -
                  48) * value / totalLength,
              height: 8,
              duration: _screenUtil.duration100,
              decoration: BoxDecoration(
                  borderRadius: _screenUtil.radius12,
                  color: DColors.accentSkyBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
