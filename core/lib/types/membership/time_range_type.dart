import 'package:get/get.dart';

///
/// am : 오전
/// pm : 오후
/// dinner : 저녁
/// dawn : 새벽
///
enum TimeRangeType { am, pm, dinner, dawn }

extension TimeRangeTypeExtension on TimeRangeType {
  static List<TimeRangeType> dataList() {
    return [
      TimeRangeType.dawn,
      TimeRangeType.am,
      TimeRangeType.pm,
      TimeRangeType.dinner
    ];
  }

  String get korean {
    switch (this) {
      case TimeRangeType.am:
        return '${'common_alarmWeekTime_range2'.tr} ';
      case TimeRangeType.pm:
        return '${'common_alarmWeekTime_range3'.tr} ';
      case TimeRangeType.dinner:
        return '${'common_alarmWeekTime_range4'.tr} ';
      case TimeRangeType.dawn:
        return '${'common_alarmWeekTime_range1'.tr} ';
    }
  }

  String get detail {
    switch (this) {
      case TimeRangeType.am:
        return '9 AM';
      case TimeRangeType.pm:
        return '3 PM';
      case TimeRangeType.dinner:
        return '6 PM';
      case TimeRangeType.dawn:
        return '3 AM';
    }
  }

  int get index {
    switch (this) {
      case TimeRangeType.am:
        return 1;
      case TimeRangeType.pm:
        return 2;
      case TimeRangeType.dinner:
        return 3;
      case TimeRangeType.dawn:
        return 0;
    }
  }
}
