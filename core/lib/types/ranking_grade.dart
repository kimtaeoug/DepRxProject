import 'dart:ui';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
///
/// 매우 좋음, 매우 나쁨, 나쁨, 좋음, 보통
///
///
enum RankingGrade { veryGood, veryBad, good, bad, normal }

extension RankingGradeExtension on RankingGrade {
  String get text {
    switch (this) {
      case RankingGrade.veryGood:
        return 'common_status_best'.tr;
      case RankingGrade.veryBad:
        return 'common_status_worst'.tr;
      case RankingGrade.good:
        return 'common_status_good'.tr;
      case RankingGrade.bad:
        return 'common_status_bad'.tr;
      case RankingGrade.normal:
        return 'common_status_normal'.tr;
    }
  }

  Color get color {
    if (this == RankingGrade.veryGood || this == RankingGrade.good) {
      return DColors.stPositiveColor;
    } else if (this == RankingGrade.veryBad || this == RankingGrade.bad) {
      return DColors.negativeStatusRed;
    } else {
      return DColors.stCautionaryColor;
    }
  }
  static RankingGrade grade(int value){
    switch(value){
      case 0:
        return RankingGrade.veryBad;
      case 1:
        return RankingGrade.bad;
      case 2:
        return RankingGrade.normal;
      case 3:
        return RankingGrade.good;
      case 4:
        return RankingGrade.veryGood;
      default:
        return RankingGrade.normal;
    }
  }
}
