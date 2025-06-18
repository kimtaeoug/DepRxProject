import 'package:get/get.dart';

///
/// Reward Type
///
enum RewardType{
  all, badge, emotion, action
}
extension RewardTypeExtension on RewardType{
  String get label{
    switch(this){
      case RewardType.all:
        return 'rewardStorage_topNav_all'.tr;
      case RewardType.badge:
        return 'rewardStorage_topNav_stamp'.tr;
      case RewardType.emotion:
        return 'common_emotion'.tr;
      case RewardType.action:
        return 'common_activity'.tr;
    }
  }
}