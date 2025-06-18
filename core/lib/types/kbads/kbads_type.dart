import 'package:get/get.dart';

///
/// 활성화 : ac
/// 회피 및 반추 : avru
/// 직무 및 학업 손실 : wsi
/// 사회적 손실 : si
///
enum KBadsType { ac, aae, jaal, sl }

extension KbadsTypeExtension on KBadsType {
  String get titleWithNumber{
    switch (this) {
      case KBadsType.ac:
        return 'reportDetail_reportCard_title_activation'.tr;
      case KBadsType.aae:
        return 'reportDetail_reportCard_title_ar'.tr;
      case KBadsType.jaal:
        return 'reportDetail_reportCard_title_wsi'.tr;
      case KBadsType.sl:
        return 'reportDetail_reportCard_title_sl'.tr;
    }
  }

  static String getTitleWithIndex(int idx){
    switch (idx) {
      case 0:
        return 'reportDetail_reportCard_title_activation'.tr;
      case 1:
        return 'reportDetail_reportCard_title_ar'.tr;
      case 2:
        return 'reportDetail_reportCard_title_wsi'.tr;
      case 3:
        return 'reportDetail_reportCard_title_sl'.tr;
      default:
        return '';
    }
  }
  //추후 min, max 받아서 계산
  double get min{
    switch (this) {
      case KBadsType.ac:
        return 0;
      case KBadsType.aae:
        return 0;
      case KBadsType.jaal:
        return 0;
      case KBadsType.sl:
        return 0;
    }
  }
  double get max{
    switch (this) {
      case KBadsType.ac:
        return 42;
      case KBadsType.aae:
        return 48;
      case KBadsType.jaal:
        return 30;
      case KBadsType.sl:
        return 30;
    }
  }
}
