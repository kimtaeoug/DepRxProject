import 'package:get/get.dart';

import '../config/routes.dart';

///
/// 서비스 온보딩
/// 보상 온보딩
/// 리포트 온보딩
/// 사용 설명서
///
enum OnBoardingType { service, reward, report, manual }

extension OnboardingTypeExtension on OnBoardingType {
  String get title {
    switch (this) {
      case OnBoardingType.service:
        return 'userGuide_arrowCell_serviceOnboarding'.tr;
      case OnBoardingType.reward:
        return 'userGuide_arrowCell_rewardOnboarding'.tr;
      case OnBoardingType.report:
        return 'userGuide_arrowCell_reportOnboarding'.tr;
      case OnBoardingType.manual:
        return 'common_userGuide'.tr;
    }
  }

  Function() get function {
    switch (this) {
      case OnBoardingType.service:
        return () {
          Get.toNamed(Routes.serviceOnboardingPage,
              arguments: {'isFromGuide': true});
        };
      case OnBoardingType.reward:
        return () {
          Get.toNamed(Routes.rewardOnboardingPage,
              arguments: {'isFromGuide': true});
        };
      case OnBoardingType.report:
        return () {
          Get.toNamed(Routes.reportOnboardingPage,
              arguments: {'isFromGuide': true});
        };
      case OnBoardingType.manual:
        return () {
          Get.toNamed(Routes.manualPage);
        };
    }
  }
}
