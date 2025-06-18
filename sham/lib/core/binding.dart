import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:sham/presentation/controllers/diary/diary_controller.dart';
import 'package:sham/presentation/controllers/quiz/quiz_controller.dart';
import '../presentation/controllers/alpha_data/alpha_data_controller.dart';
import '../presentation/controllers/find_id_pwd/find_id_pwd_controller.dart';
import '../presentation/controllers/home/home_controller.dart';
import '../presentation/controllers/inspection/bdi_controller.dart';
import '../presentation/controllers/inspection/kbads_controller.dart';
import '../presentation/controllers/join/join_controller.dart';
import '../presentation/controllers/library/library_controller.dart';
import '../presentation/controllers/login/login_controller.dart';
import '../presentation/controllers/mypage/mypage_controller.dart';
import '../presentation/controllers/report/report_controller.dart';
import '../presentation/controllers/reward/reward_controller.dart';
import '../presentation/controllers/splash/splash_controller.dart';

class DepRxBinding extends Bindings {
  final String route;

  late final MembershipUseCase membershipUseCase;
  late final BDIUseCase bdiUseCase;
  late final RewardUseCase rewardUseCase;
  late final ReportUseCase reportUseCase;
  late final EducationUseCase educationUseCase;
  late final DiaryUseCase diaryUseCase;

  DepRxBinding({required this.route}) {
    membershipUseCase = MembershipUseCase(Get.find<MembershipRepositoryImpl>());
    bdiUseCase = BDIUseCase(Get.find<BDIRepositoryImpl>());
    rewardUseCase = RewardUseCase(Get.find<RewardRepositoryImpl>());
    reportUseCase = ReportUseCase(Get.find<ReportRepositoryImpl>());
    educationUseCase = EducationUseCase(Get.find<EducationRepositoryImpl>());
    diaryUseCase = DiaryUseCase(Get.find<DiaryRepositoryImpl>());
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
      case Routes.mainPage:
        Get.put(HomeController(
            AttendanceUseCase(Get.find<AttendedRepositoryImpl>()),
            rewardUseCase,
            bdiUseCase));
        Get.put(ReportController(reportUseCase));
        Get.put(LibraryController(educationUseCase, rewardUseCase));
        Get.put(MyPageController(
            MyPageUseCase(Get.find<MyPageRepositoryImpl>()),
            membershipUseCase));
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.reportDetailPage:
        Get.put(ReportController(reportUseCase));
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
      case Routes.tedPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.tdPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.sbjPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.rmPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.readRmPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.readTdPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.readTedPage:
        Get.put(DiaryController(diaryUseCase));
        break;
      case Routes.quizPage:
        Get.put(QuizController());
        break;
      case Routes.diaryCompletePage:
        Get.put(DiaryController(diaryUseCase));
        break;
    }
  }
}
