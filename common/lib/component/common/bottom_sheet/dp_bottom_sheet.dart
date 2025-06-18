import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../feature/mypage/my_page_sheet.dart';
import 'dp_bottomsheet_container.dart';

class DPBottomSheet {
  static void showBottomSheet(Widget child,
      {double minSize = 0,
      double maxSize = 0.9,
      Color? backgroundColor,
      Color? barrierColor,
      bool enableDag = true,
      bool isDismissible = true}) {
    Get.bottomSheet(
        DPBottomSheetContainer(
            minSize: minSize, maxSize: maxSize, child: child),
        isScrollControlled: true,
        enableDrag: enableDag,
        isDismissible: isDismissible,
        backgroundColor: backgroundColor,
        barrierColor: barrierColor);
  }

  static void showBDefaultBottomSheet(Widget child,
      {Color? backgroundColor,
      Color? barrierColor,
      bool enableDrag = true,
      bool isDismissible = true,
      bool isScrollControlled = false}) {
    Get.bottomSheet(child,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        backgroundColor: backgroundColor,
        barrierColor: barrierColor);
  }

  static void showMyPageSheet(String title, String content,
      {bool isPrivacyConsent = false}) {
    showBottomSheet(MyPageSheet(title: title, content: content),
        maxSize: isPrivacyConsent ? 0.65 : 0.9);
  }
}
