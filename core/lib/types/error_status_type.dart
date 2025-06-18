import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
enum ErrorStatusType{
  normal, success, error
}
extension IconsStatusStyle on ErrorStatusType{
  Color get color{
    switch(this){
      case ErrorStatusType.normal:
        return DColors.inInactiveColor2;
      case ErrorStatusType.success:
        return DColors.labelNormalColor;
      case ErrorStatusType.error:
        return DColors.warningAccentColor;
    }
  }
  bool get boolValue{
    switch(this){
      case ErrorStatusType.normal:
        return false;
      case ErrorStatusType.success:
        return false;
      case ErrorStatusType.error:
        return true;
    }
  }
}