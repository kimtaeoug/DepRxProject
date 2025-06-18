import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../error_status_type.dart';

enum IdErrorType { empty, invalid,  none, pass }

extension IdErrorTypeValue on IdErrorType {
  String get text {
    switch (this) {
      case IdErrorType.empty:
        return 'common_textfield_hint_id'.tr;
      case IdErrorType.invalid:
        return 'findPwd_toast_error_id'.tr;
      case IdErrorType.none:
        return '';
      case IdErrorType.pass:
        return '';
    }
  }

  bool get value {
    if (this == IdErrorType.pass || this == IdErrorType.none) {
      return false;
    } else {
      return true;
    }
  }

  Color get containerColor {
    switch (this) {
      case IdErrorType.empty:
        return DColors.white;
      case IdErrorType.invalid:
        return DColors.white;
      case IdErrorType.none:
        return DColors.white;
      case IdErrorType.pass:
        return DColors.primaryNormalColor.withValues(alpha: 0.5);
    }
  }

  Color get borderColor {
    switch (this) {
      case IdErrorType.empty:
        return DColors.warningAccentColor;
      case IdErrorType.invalid:
        return DColors.warningAccentColor;
      case IdErrorType.none:
        return DColors.white;
      case IdErrorType.pass:
        return DColors.primaryNormalColor;
    }
  }

  Color get iconColor{
    switch(this){
      case IdErrorType.empty:
        return DColors.warningAccentColor;
      case IdErrorType.invalid:
        return DColors.warningAccentColor;
      case IdErrorType.none:
        return DColors.inInactiveColor2;
      case IdErrorType.pass:
        return DColors.black;
    }
  }

  ErrorStatusType get statusType {
    switch (this) {
      case IdErrorType.empty:
        return ErrorStatusType.error;
      case IdErrorType.invalid:
        return ErrorStatusType.error;
      case IdErrorType.none:
        return ErrorStatusType.normal;
      case IdErrorType.pass:
        return ErrorStatusType.success;
    }
  }
}
