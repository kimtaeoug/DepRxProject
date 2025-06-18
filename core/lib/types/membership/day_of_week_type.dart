import 'package:get/get.dart';

///
/// 요일
///
enum DayOfWeekType{
  mon, thu, wed, thur, fri, sat, sun
}
extension DayOfWeekTypeExtension on DayOfWeekType{
  String get korean{
    switch(this){
      case DayOfWeekType.mon:
        return 'common_week_mon'.tr;
      case DayOfWeekType.thu:
        return 'common_week_thu'.tr;
      case DayOfWeekType.wed:
        return 'common_week_wed'.tr;
      case DayOfWeekType.thur:
        return 'common_week_thr'.tr;
      case DayOfWeekType.fri:
        return 'common_week_fri'.tr;
      case DayOfWeekType.sat:
        return 'common_week_sat'.tr;
      case DayOfWeekType.sun:
        return 'common_week_sun'.tr;
    }
  }
  int get index{
    switch(this){
      case DayOfWeekType.mon:
        return 0;
      case DayOfWeekType.thu:
        return 1;
      case DayOfWeekType.wed:
        return 2;
      case DayOfWeekType.thur:
        return 3;
      case DayOfWeekType.fri:
        return 4;
      case DayOfWeekType.sat:
        return 5;
      case DayOfWeekType.sun:
        return 6;
    }
  }
}