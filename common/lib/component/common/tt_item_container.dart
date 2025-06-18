import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class TTItemContainer extends StatelessWidget {
  final TodayTaskItemModel data;
  final DiaryType type;
  final Function()? function;
  final bool needHead;


  TTItemContainer(
      {super.key, required this.data, required this.type, this.function, this.needHead = false});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _contentsStyle =
  DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _doneContentsStyle = DpTextStyle.b1.style.copyWith(
      color: DColors.labelAlternativeColor2,
      decoration: TextDecoration.lineThrough);
  final TextStyle _headStyle =
  DpTextStyle.b3.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _headContainer(),
        GestureDetector(
          onTap: () {
            if (function != null) {
              function?.call();
            }
          },
          child: Container(
            width: _screenUtil.width,
            decoration: BoxDecoration(
                borderRadius: _screenUtil.radius20,
                border: Border.all(color: DColors.white.withValues(alpha: 0.6)),
                color: DColors.white,
                boxShadow: _screenUtil.pressShadow()),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: data.done ? _doneContainer() : yetContainer(),
          ),
        )
      ],
    );
  }

  Widget _headContainer() {
    if (needHead) {
      DateTime dateTime = DateTime.parse(data.date);
      String monthDay = TimeUtil.convertDateTo(dateTime, 'MM/dd');
      String weekOfDay = TimeUtil.getDayOfWeek(dateTime);
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$monthDay $weekOfDay${'common_dayOfWeek'.tr}',
            style: _headStyle,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  //오늘의 일기
  //오늘의 감정 일기
  //나를 알아보기
  Widget yetContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Resource.diaryImage(type.icon, width: 50, height: 50),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
              type.text,
              style: _contentsStyle,
            ))
      ],
    );
  }

  Widget _doneContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Resource.diaryImage(type.icon, width: 50, height: 50),
        ),
        Expanded(
            child: Text(
              type.text,
              style: _doneContentsStyle,
            )),
        _checkBox
      ],
    );
  }

  final Widget _checkBox = Container(
    width: 26,
    height: 26,
    decoration: const BoxDecoration(
        color: DColors.primaryNormalColor,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Center(
      child: Resource.icon('ic_check_only_enable',
          width: 14,
          height: 10,
          boxFit: BoxFit.fitWidth,
          colorFilter: const ColorFilter.mode(DColors.white, BlendMode.srcIn)),
    ),
  );
}
