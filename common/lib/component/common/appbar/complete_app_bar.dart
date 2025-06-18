import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_constants.dart';

import 'package:resource/resource_manager.dart';
class CompleteAppBar extends StatelessWidget {
  final String title;

  CompleteAppBar({super.key, required this.title});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle = DpTextStyle.h6.style.copyWith(
      color: DColors.black, height: 1.445, fontWeight: FontWeight.w600);
  final TextStyle _completeStyle = DpTextStyle.b5.style.copyWith(
    color: DColors.primaryNormalColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: EdgeInsets.only(top: _screenUtil.topPadding),
      color: DColors.transparent,
      child: SizedBox(
        width: _screenUtil.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: _screenUtil.svgIcon('$ICON_PATH/ic_arrow_left_sharp.svg'),
                ),
              ),
            ),
            Text(
              title,
              style: _titleStyle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Center(
                    child: Text(
                      'common_complete'.tr,
                      style: _completeStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
