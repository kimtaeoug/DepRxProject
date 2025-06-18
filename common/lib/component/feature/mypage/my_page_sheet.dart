import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';

class MyPageSheet extends StatelessWidget {
  final String title;
  final String content;

  MyPageSheet({
    super.key,
    required this.title,
    required this.content,
  });

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h5.style.copyWith(color: DColors.black);
  final TextStyle _contentStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);
  final TextStyle _confirmStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);

  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            width: 36,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                color: DColors.tertiaryColor.withOpacity(0.3)),
          ),
        ),
        Container(
          width: _screenUtil.width,
          padding: const EdgeInsets.only(top: 7, bottom: 9),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: const BoxDecoration(
                    color: DColors.bgBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text(
                  'common_complete'.tr,
                  style: _confirmStyle,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: _screenUtil.width,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: _titleStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: _screenUtil.width,
          child: Text(
            content,
            style: _contentStyle,
          ),
        )
      ],
    );
  }
}
