import 'package:get/get.dart';

import '../../config/routes.dart';

///
/// 회원정보 -> member
/// 앱 정보 -> appInfo
/// 이용약관 및 정책 -> termAndPol
/// 사용 설명서 -> descriptor
/// 알림 설정 -> alarm
/// 마케팅 수신 동의 -> marketing
///
enum MyPageItemType {
  member,
  appInfo,
  termAndPol,
  descriptor,
  alarm,
  marketing
}

extension MyPageItemTypeExtension on MyPageItemType {
  String get korean {
    switch (this) {
      case MyPageItemType.member:
        return 'common_userInfo'.tr;
      case MyPageItemType.appInfo:
        return 'common_appInfo'.tr;
      case MyPageItemType.termAndPol:
        return 'myPageMain_arrowCell_policy'.tr;
      case MyPageItemType.descriptor:
        return 'common_userGuide'.tr;
      case MyPageItemType.alarm:
        return 'common_settingAlarm'.tr;
      case MyPageItemType.marketing:
        return 'common_marketing'.tr;
    }
  }

  String get route {
    switch (this) {
      case MyPageItemType.member:
        return Routes.myPageMemberPage;
      case MyPageItemType.appInfo:
        return Routes.myPageAppInfoPage;
      case MyPageItemType.termAndPol:
        return Routes.myPageTermPage;
      case MyPageItemType.descriptor:
        return Routes.myPageGuidePage;
      case MyPageItemType.alarm:
        return Routes.myPageAlarmPage;
      case MyPageItemType.marketing:
        return '';
    }
  }
}
