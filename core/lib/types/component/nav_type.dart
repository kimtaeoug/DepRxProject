import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

///
/// Bottom Navigation Type
///
enum NavType { home, report, document, activity, profile }

extension NavTypeStyle on NavType {
  String get title {
    switch (this) {
      case NavType.home:
        return 'common_bottomNav_home'.tr;
      case NavType.report:
        return 'common_bottomNav_report'.tr;
      case NavType.document:
        return 'common_bottomNav_library'.tr;
      case NavType.activity:
        return 'common_bottomNav_activity'.tr;
      case NavType.profile:
        return 'common_bottomNav_myPage'.tr;
    }
  }
  String get shamTitle {
    switch (this) {
      case NavType.home:
        return 'common_bottomNav_home'.tr;
      case NavType.report:
        return 'common_bottomNav_report'.tr;
      case NavType.document:
        return 'common_bottomNav_library'.tr;
      case NavType.activity:
        return '기록';
      case NavType.profile:
        return 'common_bottomNav_myPage'.tr;
    }
  }
  static final String _prefixPath = '$ICON_PATH/ic_';

  static String imgPath(NavType type, {bool isActivate = false}) =>
      '$_prefixPath${type.name}_${isActivate ? 'activate' : 'inactivate'}.svg';

  static final TextStyle _defaultStyle = Styler.style(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: -0.24,
      color: DColors.primaryNormalColor);

  static TextStyle textStyle(NavType type, {bool isActivate = false}) =>
      _defaultStyle.copyWith(
        color: isActivate ? DColors.primaryNormalColor : DColors
            .inInactiveColor2,
      );
}
