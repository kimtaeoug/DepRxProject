import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';
///
/// 정서 - emotion
/// 실천행동 - action
/// 인지 - recognition
/// 운동 및 신체활동 - EPA(Exercise and physical activity)
/// 음식 - Food
/// 절제 - Moderation
///
enum BAType{
  emotion, action, recognition, epa, food, moderation
}
extension BaTypeStyle on BAType{
  Color get color{
    switch(this){
      case BAType.emotion:
        return DColors.primaryNormalColor;
      case BAType.action:
        return DColors.actionColor;
      case BAType.recognition:
        return DColors.palletPurpleColor;
      case BAType.epa:
        return DColors.palletPink;
      case BAType.food:
        return DColors.foodColor;
      case BAType.moderation:
        return DColors.moderationColor;
    }
  }

  TextStyle get style{
    return DpTextStyle.detail1.style.copyWith(color :color);
  }

  static BAType getBAType(String input){
    switch(input){
      case '정서':
        return BAType.emotion;
      case '실천행동':
        return BAType.action;
      case '인지':
        return BAType.recognition;
      case '운동 및 신체활동':
        return BAType.epa;
      case '음식':
        return BAType.food;
      case '절제':
        return BAType.moderation;
      default:
        return BAType.moderation;
    }
  }
}