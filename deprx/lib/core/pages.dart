import 'package:deprx/presentation/pages/activity/activity_complete_page.dart';
import 'package:deprx/presentation/pages/activity/activity_detail_page.dart';
import 'package:deprx/presentation/pages/activity/activity_emotion_page.dart';
import 'package:deprx/presentation/pages/alpha_data/alpha_data_complete_page.dart';
import 'package:deprx/presentation/pages/alpha_data/alpha_data_page.dart';
import 'package:deprx/presentation/pages/alpha_data/keyword_page.dart';
import 'package:deprx/presentation/pages/deactivate/deactivate_page.dart';
import 'package:deprx/presentation/pages/deactivate/deactivate_reset_page.dart';
import 'package:deprx/presentation/pages/etc/dp_exception_page.dart';
import 'package:deprx/presentation/pages/etc/program_complete_page.dart';
import 'package:deprx/presentation/pages/etc/server_update_page.dart';
import 'package:deprx/presentation/pages/find_id_pwd/find_id_no_page.dart';
import 'package:deprx/presentation/pages/join/auth_page.dart';
import 'package:deprx/presentation/pages/emotion/emotion_page.dart';
import 'package:deprx/presentation/pages/etc/server_inspection_page.dart';
import 'package:deprx/presentation/pages/find_id_pwd/find_id_page.dart';
import 'package:deprx/presentation/pages/find_id_pwd/find_pwd_page.dart';
import 'package:deprx/presentation/pages/inspection/bdi/bdi_auto_complete_page.dart';
import 'package:deprx/presentation/pages/inspection/bdi/bdi_final_complete_page.dart';
import 'package:deprx/presentation/pages/inspection/bdi/bdi_loading_page.dart';
import 'package:deprx/presentation/pages/inspection/bdi/bdi_select_page.dart';
import 'package:deprx/presentation/pages/inspection/kbads/kbads_progress_page.dart';
import 'package:deprx/presentation/pages/inspection/kbads/kbads_start_page.dart';
import 'package:deprx/presentation/pages/join/account/join_id_page.dart';
import 'package:deprx/presentation/pages/join/account/join_pwd_page.dart';
import 'package:deprx/presentation/pages/join/personal_info_page.dart';
import 'package:deprx/presentation/pages/join/personal_info_result_page.dart';
import 'package:deprx/presentation/pages/join/term_detail_page.dart';
import 'package:deprx/presentation/pages/join/term_page.dart';
import 'package:deprx/presentation/pages/library/continuous_edu_page.dart';
import 'package:deprx/presentation/pages/library/curriculum_detail_page.dart';
import 'package:deprx/presentation/pages/library/education_page.dart';
import 'package:deprx/presentation/pages/login/login_page.dart';
import 'package:deprx/presentation/pages/login/social_login_page.dart';
import 'package:deprx/presentation/pages/mypage/membership/leave_complete_page.dart';
import 'package:deprx/presentation/pages/mypage/membership/leave_page.dart';
import 'package:deprx/presentation/pages/mypage/membership/my_check_pwd_page.dart';
import 'package:deprx/presentation/pages/mypage/membership/reset_pwd_page.dart';
import 'package:deprx/presentation/pages/mypage/my_alarm_page.dart';
import 'package:deprx/presentation/pages/mypage/my_app_info_page.dart';
import 'package:deprx/presentation/pages/mypage/my_membership_page.dart';
import 'package:deprx/presentation/pages/mypage/my_onboarding_page.dart';
import 'package:deprx/presentation/pages/mypage/my_term_page.dart';
import 'package:deprx/presentation/pages/onboarding/report_onboarding.dart';
import 'package:deprx/presentation/pages/onboarding/reward_onboarding_page.dart';
import 'package:deprx/presentation/pages/onboarding/sevice_onboarding_page.dart';
import 'package:deprx/presentation/pages/report/report_detail_page.dart';
import 'package:deprx/presentation/pages/reward/receive/receive_stamp_reward_page.dart';
import 'package:deprx/presentation/pages/reward/receive/receive_week_reward_page.dart';
import 'package:deprx/presentation/pages/reward/reward_detail_page.dart';
import 'package:deprx/presentation/pages/reward/reward_final_page.dart';
import 'package:deprx/presentation/pages/reward/reward_main_page.dart';
import 'package:deprx/presentation/pages/reward/reward_storage_page.dart';
import 'package:deprx/presentation/pages/reward/select/reward_select_page.dart';
import 'package:deprx/presentation/pages/splash/splash_page.dart';
import 'package:deprx/presentation/pages/tab/tab_page.dart';
import 'package:get/get.dart';
import '../presentation/pages/activity/activity_select_page.dart';
import 'binding.dart';
import 'package:common/component/feature/mypage/dp_pdf_viewer.dart';
import 'package:core/core.dart';

class Pages {
  static final List<GetPage> list = [
    GetPage(
        name: Routes.splash,
        page: () => SplashPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.splash)),

    ///
    /// MemberShip
    ///
    GetPage(
        name: Routes.auth,
        page: () => AuthPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.auth)),
    GetPage(
        name: Routes.socialLogin,
        page: () => SocialLoginPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.socialLogin)),
    GetPage(
        name: Routes.deactivate,
        page: () => DeactivatePage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.deactivate)),
    GetPage(
        name: Routes.deactivateResetPwd,
        page: () => DeactivateResetPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.deactivateResetPwd)),
    GetPage(
        name: Routes.baseLogin,
        page: () => LoginPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.baseLogin)),
    GetPage(
        name: Routes.findId,
        page: () => FindIdPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.findId)),
    GetPage(
        name: Routes.findPwd,
        page: () => FindPwdPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.findPwd)),
    GetPage(
        name: Routes.signUpAccountId,
        page: () => JoinIdPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpAccountPwd,
        page: () => JoinPwdPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpTerms,
        page: () => TermPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpTermService,
        page: () => TermDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpTermPrivacyConsent,
        page: () => TermDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpTermPrivacyPolicy,
        page: () => TermDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpTermMarketing,
        page: () => TermDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpPersonalInfo,
        page: () => PersonalInfoPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpSummary,
        page: () => PersonalInfoResultPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.signUpKeyword,
        page: () => KeywordPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.signUpKeyword)),
    GetPage(
      name: Routes.signUpAlpha,
      page: () => AlphaDataPage(),
      transition: Transition.fade,
    ),
    GetPage(
        name: Routes.signUpComplete,
        page: () => AlphaDataCompletePage(),
        transition: Transition.fade),

    ///
    /// Inspection
    ///
    GetPage(
        name: Routes.kBADSIntro,
        page: () => KBadsStartPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.kBADSIntro)),
    GetPage(
        name: Routes.kBADSProgress,
        page: () => KBADSProgressPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.kBADSProgress)),

    ///
    /// Tab
    ///
    GetPage(
        name: Routes.mainPage,
        page: () => TapPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),
    GetPage(
        name: Routes.homePage,
        page: () => TapPage(idx: 0),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),
    GetPage(
        name: Routes.reportPage,
        page: () => TapPage(idx: 1),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),
    GetPage(
        name: Routes.libraryPage,
        page: () => TapPage(idx: 2),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),
    GetPage(
        name: Routes.activityPage,
        page: () => TapPage(idx: 3),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),
    GetPage(
        name: Routes.myPage,
        page: () => TapPage(idx: 4),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),

    ///
    /// report
    ///
    GetPage(
        name: Routes.reportDetailPage,
        page: () => ReportDetailPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.reportDetailPage)),

    ///
    /// Library
    ///
    GetPage(
        name: Routes.curriculumDetailPage,
        page: () => CurriculumDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.educationPage,
        page: () => EducationPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.continuousEducationPage,
        page: () => ContinuousEduPage(),
        transition: Transition.fade),

    ///
    /// Activity
    ///
    GetPage(
        name: Routes.activityEmotionPage,
        page: () => ActivityEmotionPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.activityDetailPage,
        page: () => ActivityDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.activityCompletePage,
        page: () => ActivityCompletePage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.activitySelectPage,
        page: () => ActivitySelectPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.activitySelectPage)),

    ///
    /// MyPage
    ///
    GetPage(
        name: Routes.myPageMemberPage,
        page: () => MyMemberShipPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.mainPage)),

    GetPage(
        name: Routes.leavePage,
        page: () => LeavePage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.leaveCompletePage,
        page: () => LeaveCompletePage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.checkPwdPage,
        page: () => MyCheckPwdPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.resetPwdPage,
        page: () => ResetPwdPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.myPageTermPage,
        page: () => MyTermPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.myPageAppInfoPage,
        page: () => MyAppInfoPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.myPageGuidePage,
        page: () => MyOnBoardingPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.myPageAlarmPage,
        page: () => MyAlarmPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.findNoId,
        page: () => FindIdNoPage(),
        transition: Transition.fade),

    ///
    /// OnBoarding
    ///
    GetPage(
        name: Routes.serviceOnboardingPage,
        page: () => ServiceOnboardingPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.rewardOnboardingPage,
        page: () => RewardOnboardingPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.reportOnboardingPage,
        page: () => ReportOnboardingPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.manualPage,
        page: () => DPPdfViewer(),
        transition: Transition.fade),

    ///
    /// Reward
    ///
    GetPage(
        name: Routes.rewardDetailPage,
        page: () => RewardDetailPage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.rewardStoragePage,
        page: () => RewardStoragePage(),
        transition: Transition.fade),
    GetPage(
        name: Routes.rewardMainPage,
        page: () => RewardMainPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.rewardMainPage)),
    GetPage(
        name: Routes.rewardReceiveWeekPage,
        page: () => const ReceiveWeekRewardPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.rewardReceiveWeekPage)),
    GetPage(
        name: Routes.rewardReceiveStampPage,
        page: () => ReceiveStampRewardPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.rewardReceiveStampPage)),
    GetPage(
        name: Routes.rewardSelectPage,
        page: () => RewardSelectPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.rewardSelectPage)),
    GetPage(
        name: Routes.rewardFinalPage,
        page: () => RewardFinalPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.rewardFinalPage)),

    ///
    /// BDI
    ///
    GetPage(
        name: Routes.bdiSelectPage,
        page: () => BDISelectPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.bdiSelectPage)),
    GetPage(
        name: Routes.bdiLoadingPage,
        page: () => BDILoadingPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.bdiLoadingPage)),
    GetPage(
        name: Routes.bdiAutoCompletePage,
        page: () => BDIAutoCompletePage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.bdiAutoCompletePage)),
    GetPage(
        name: Routes.bdiFinalCompletePage,
        page: () => BDIFinalCompletePage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.bdiFinalCompletePage)),

    ///
    /// Emotion
    ///
    GetPage(
        name: Routes.todayEmotionPage,
        page: () => EmotionPage(),
        transition: Transition.fade,
        binding: DepRxBinding(route: Routes.todayEmotionPage)),

    ///
    /// Etc
    ///
    GetPage(
        name: Routes.serverInspectionPage,
        page: () => ServerInspectionPage(),
        transition: Transition.fade),
    GetPage(name: Routes.errorPage, page: () => DPExceptionPage(), transition: Transition.fade),
    GetPage(name: Routes.programEndPage, page: () => ProgramCompletePage(), transition: Transition.fade),
    GetPage(name: Routes.serverUpdatePage, page: () => ServerUpdatePage(), transition: Transition.fade)
  ];
}
