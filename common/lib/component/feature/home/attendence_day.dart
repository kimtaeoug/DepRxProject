import 'package:flutter/cupertino.dart';

import 'package:core/core.dart';
import 'package:resource/resource_manager.dart';

class AttendenceDay extends StatelessWidget {
  final int day;
  final AttendDayType type;
  final bool isToday;
  final bool isInit;

  AttendenceDay(
      {super.key,
      required this.day,
      this.type = AttendDayType.none,
      this.isToday = false,
      this.isInit = false});

  final TextStyle _dayStyle = DpTextStyle.b2.style.copyWith();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: DColors.transparent,
      child: Stack(
        children: [
          _back(),
          Center(
            child: Text(
              day.toString(),
              style: _dayStyle.copyWith(
                  color: isToday ? DColors.white : type.textColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _back() {
    if (isToday) {
      if (isInit) {
        return Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: DColors.primaryNormalColor),
        );
      } else {
        if (type != AttendDayType.click) {
          return Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: DColors.labelDisableColor3),
          );
        } else {
          return Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: DColors.primaryNormalColor),
          );
        }
      }
    }
    switch (type) {
      case AttendDayType.attend:
        return Resource.icon('ic_day_stamp', width: 40, height: 40);
      case AttendDayType.click:
        return Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: DColors.primaryNormalColor),
        );
      case AttendDayType.today:
        return Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: DColors.labelDisableColor3),
        );
      case AttendDayType.none:
        return Container();
    }
  }
}
