import '../../domain/repositories/procedure/procedure_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/ba_api.dart';
import '../provider/api/etc_api.dart';
import '../provider/api/report_api.dart';
import '../provider/api/reward_api.dart';

///
/// Repository with Procedure
///
class ProcedureRepositoryImpl extends ProcedureRepository {
  @override
  Future<DefaultResponseModel> getProcedure(
      String accessToken, String fcmToken, bool recursionFlag) async {
    return await ETCAPI.procedure({
      'accessToken': accessToken,
      'fcmToken': fcmToken,
      'recursionFlag': recursionFlag
    }).request();
  }

  @override
  Future<DefaultResponseModel> getRecommendedBAList() async {
    return await BAAPI.getRecommendedBAList(null).request();
  }

  @override
  Future<DefaultResponseModel> getWeekRewardList(int week) async {
    return await RewardAPI.weekList({'week': week}).request();
  }

  @override
  Future<DefaultResponseModel> receiveWeekReward(int round, int week) async {
    return await RewardAPI.receiveReward({'round': round, 'week': week})
        .request();
  }

  @override
  Future<DefaultResponseModel> weekReport(int round, int week) async {
    return await ReportAPI.weekReport({'round': round, 'week': week}).request();
  }
}
