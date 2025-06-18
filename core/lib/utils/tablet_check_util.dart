import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

///
/// Table 비율 또는 사이즈인지 Check
///
class TabletCheckUtil {
  static bool check(ScreenUtil screenUtil, BuildContext context) =>
      _checkTabletRatio(screenUtil) || _checkTabletSize(context);

  static bool _checkTabletRatio(ScreenUtil screenUtil) =>
      screenUtil.width >= screenUtil.height;

  static bool _checkTabletSize(BuildContext context) => context.isTablet;


  static bool checkWithoutContext(ScreenUtil screenUtil) =>
      _checkTabletRatio(screenUtil) || _checkTabletSizeWithoutContext();

  static bool _checkTabletSizeWithoutContext() => Get.context?.isTablet ?? false;

}
