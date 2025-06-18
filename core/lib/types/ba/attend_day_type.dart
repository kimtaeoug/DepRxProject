import 'package:flutter/material.dart';
import 'package:resource/resource_manager.dart';

///
/// 출석, 클릭, today, none
///
enum AttendDayType{
  attend, click, today, none
}
extension AttendDayTypeExtension on AttendDayType{
  Color get textColor{
    if(this == AttendDayType.today || this == AttendDayType.click){
      return DColors.white;
    }else{
      return DColors.labelNormalColor;
    }
  }
}