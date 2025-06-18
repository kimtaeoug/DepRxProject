import 'package:api/api.dart';
import 'package:get/get.dart';

class Dependency {
  static Future<void> init() async {
    Get.put(AttendedRepositoryImpl());
    Get.put(BARepositoryImpl());
    Get.put(BDIRepositoryImpl());
    Get.put(EducationRepositoryImpl());
    Get.put(KBADSRepositoryImpl());
    Get.put(MembershipRepositoryImpl());
    Get.put(MyPageRepositoryImpl());
    Get.put(ProcedureRepositoryImpl());
    Get.put(ReportRepositoryImpl());
    Get.put(RewardRepositoryImpl());
    Get.put(SDUIRepositoryImpl());
    Get.put(TodayEmotionRepositoryImpl());
    Get.put(RankingRepositoryImpl());
    Get.put(SocialRepositoryImpl());
  }
}
