import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

enum OutlineButtonType{
  blue, black, disabled
}

extension OutlineBtnType on OutlineButtonType{
  Color get color{
    switch(this){
      case OutlineButtonType.blue:
        return DColors.primaryNormalColor;
      case OutlineButtonType.black:
        return DColors.black;
      case OutlineButtonType.disabled:
        return DColors.labelAssistiveColor2;
    }
  }
}