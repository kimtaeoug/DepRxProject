import 'package:deprx/presentation/controllers/activity/activity_controller.dart';
import 'package:deprx/presentation/controllers/alpha_data/alpha_data_controller.dart';
import 'package:deprx/presentation/controllers/deactivate/deactivate_controller.dart';
import 'package:deprx/presentation/controllers/emotion/emotion_controller.dart';
import 'package:deprx/presentation/controllers/find_id_pwd/find_id_pwd_controller.dart';
import 'package:deprx/presentation/controllers/home/home_controller.dart';
import 'package:deprx/presentation/controllers/inspection/bdi_controller.dart';
import 'package:deprx/presentation/controllers/inspection/kbads_controller.dart';
import 'package:deprx/presentation/controllers/join/join_controller.dart';
import 'package:deprx/presentation/controllers/library/library_controller.dart';
import 'package:deprx/presentation/controllers/login/login_controller.dart';
import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:deprx/presentation/controllers/ranking/ranking_controller.dart';
import 'package:deprx/presentation/controllers/report/report_controller.dart';
import 'package:deprx/presentation/controllers/reward/reward_controller.dart';
import 'package:deprx/presentation/controllers/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class DepRxBinding extends Bindings {
  final String route;

  late final MembershipUseCase membershipUseCase;
  late final BDIUseCase bdiUseCase;
  late final RewardUseCase rewardUseCase;
  late final ReportUseCase reportUseCase;
  late final EducationUseCase educationUseCase;
  late final BAUseCase baUseCase;
  late final RankingUseCase rankingUseCase;

  DepRxBinding({required this.route}) {
    membershipUseCase = MembershipUseCase(Get.find<MembershipRepositoryImpl>());
    bdiUseCase = BDIUseCase(Get.find<BDIRepositoryImpl>());
    rewardUseCase = RewardUseCase(Get.find<RewardRepositoryImpl>());
    reportUseCase = ReportUseCase(Get.find<ReportRepositoryImpl>());
    educationUseCase = EducationUseCase(Get.find<EducationRepositoryImpl>());
    baUseCase = BAUseCase(Get.find<BARepositoryImpl>());
    rankingUseCase = RankingUseCase(Get.find<RankingRepositoryImpl>());
  }

  @override
  void dependencies() {
    switch (route) {
      case Routes.splash:
        Get.put(SplashController());
        break;
      case Routes.socialLogin:
        Get.put(LoginController(membershipUseCase));
        break;
      case Routes.baseLogin:
        Get.put(LoginController(membershipUseCase));
        break;
      case Routes.deactivate:
        Get.put(DeactivateController(membershipUseCase));
        break;
      case Routes.deactivateResetPwd:
        Get.put(DeactivateController(membershipUseCase));
        break;
      case Routes.auth:
        Get.put(JoinController(membershipUseCase));
        break;
      case Routes.findId:
        Get.put(FindIdPwdController(membershipUseCase));
        break;
      case Routes.findPwd:
        Get.put(FindIdPwdController(membershipUseCase));
        break;
      case Routes.signUpKeyword:
        Get.put(AlphaDataController(
            SDUIUseCase(Get.find<SDUIRepositoryImpl>()), membershipUseCase));
        break;
      case Routes.bdiSelectPage:
        Get.put(BDIController(bdiUseCase));
        break;
      case Routes.bdiLoadingPage:
        Get.put(BDIController(bdiUseCase));
        break;
      case Routes.bdiAutoCompletePage:
        Get.put(BDIController(bdiUseCase));
        break;
      case Routes.todayEmotionPage:
        Get.put(EmotionController(
            TodayEmotionUseCase(Get.find<TodayEmotionRepositoryImpl>()),
            rewardUseCase));
        break;
      case Routes.activitySelectPage:
        Get.put(ActivityController(baUseCase, rewardUseCase));
        break;
      case Routes.mainPage:
        Get.put(HomeController(
            AttendanceUseCase(Get.find<AttendedRepositoryImpl>()),
            rewardUseCase,
            bdiUseCase,
            baUseCase));
        Get.put(ReportController(reportUseCase, baUseCase));
        Get.put(LibraryController(educationUseCase, rewardUseCase));
        Get.put(ActivityController(baUseCase, rewardUseCase));
        Get.put(MyPageController(
            MyPageUseCase(Get.find<MyPageRepositoryImpl>()),
            membershipUseCase));
        Get.put(RankingController(rankingUseCase));
        break;
      case Routes.reportDetailPage:
        Get.put(ReportController(reportUseCase, baUseCase));
        Get.put(RankingController(rankingUseCase));
        break;
      case Routes.rewardMainPage:
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
      case Routes.rewardSelectPage:
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
      case Routes.rewardFinalPage:
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
      case Routes.activityEmotionPage:
        Get.put(ActivityController(baUseCase, rewardUseCase));
        break;
      case Routes.rewardReceiveStampPage:
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
      case Routes.rewardReceiveWeekPage:
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
      case Routes.kBADSIntro:
        Get.put(KBADSController(KBADSUseCase(Get.find<KBADSRepositoryImpl>())));
        break;
      case Routes.kBADSProgress:
        Get.put(KBADSController(KBADSUseCase(Get.find<KBADSRepositoryImpl>())));
        Get.put(RewardController(rewardUseCase, reportUseCase));
        break;
    }
  }
}
