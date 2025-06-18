
import 'package:get/get.dart';

import '../../config/routes.dart';

///
/// 비밀번호 재설정 -> resetPwd
/// 로그아웃 하기 -> logout
/// 회원 탈퇴 -> leave
///
enum MyMembershipType { resetPwd, logout, leave }

extension MyMembershipTypeExtension on MyMembershipType {
  String get label {
    switch (this) {
      case MyMembershipType.resetPwd:
        return 'common_appBar_title_resetPwd'.tr;
      case MyMembershipType.logout:
        return 'myPageUserInfo_logout'.tr;
      case MyMembershipType.leave:
        return 'common_userDelete'.tr;
    }
  }

  String get route {
    switch (this) {
      case MyMembershipType.resetPwd:
        return Routes.checkPwdPage;
      case MyMembershipType.logout:
        return Routes.socialLogin;
      case MyMembershipType.leave:
        return Routes.leavePage;
    }
  }
}
