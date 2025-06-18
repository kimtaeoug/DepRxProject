import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../error_status_type.dart';

enum PwdErrorType{
  empty, none, pass, invalid
}
extension PwdErrorTypeValue on PwdErrorType{
  String get text{
    switch(this){
      case PwdErrorType.empty:
        return 'common_textfield_hint_pwd'.tr;
      case PwdErrorType.pass:
        return '';
      case PwdErrorType.none:
        return '';
      case PwdErrorType.invalid:
        return '';
    }
  }

  bool get value{
    if(this == PwdErrorType.pass || this == PwdErrorType.none){
      return false;
    }else{
      return true;
    }
  }
  Color get containerColor{
    switch(this){
      case PwdErrorType.empty:
        return DColors.warningAccentColor;
      case PwdErrorType.none:
        return DColors.white;
      case PwdErrorType.pass:
        return DColors.primaryNormalColor.withOpacity(0.5);
      case PwdErrorType.invalid:
        return DColors.white;
    }
    
  }
  
  Color get borderColor{
    switch(this){
      case PwdErrorType.empty:
        return DColors.warningAccentColor;
      case PwdErrorType.none:
        return DColors.white;
      case PwdErrorType.pass:
        return DColors.primaryNormalColor;
      case PwdErrorType.invalid:
        return DColors.warningAccentColor;
    }
  }
  Color get iconColor{
    switch(this){
      case PwdErrorType.empty:
        return DColors.warningAccentColor;
      case PwdErrorType.none:
        return DColors.inInactiveColor2;
      case PwdErrorType.pass:
        return DColors.black;
      case PwdErrorType.invalid:
        return DColors.warningAccentColor;
    }
  }
  ErrorStatusType get statusType{
    switch(this){
      case PwdErrorType.empty:
        return ErrorStatusType.error;
      case PwdErrorType.none:
        return ErrorStatusType.normal;
      case PwdErrorType.pass:
        return ErrorStatusType.success;
      case PwdErrorType.invalid:
        return ErrorStatusType.error;
    }
  }
}