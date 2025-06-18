import '../../domain/repositories/reward/reward_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/reward_api.dart';

///
/// Repository with Reward
///
class RewardRepositoryImpl extends RewardRepository {
  @override
  Future<DefaultResponseModel> getFinalReward() async {
    return await RewardAPI.finalReward(null).request();
  }

  @override
  Future<DefaultResponseModel> getMainRewardList() async {
    return await RewardAPI.main(null).request();
  }

  @override
  Future<DefaultResponseModel> getStampReward(int round) async {
    return await RewardAPI.stamp({'round': round}).request();
  }

  @override
  Future<DefaultResponseModel> getTotalRewardList() async {
    return await RewardAPI.allList(null).request();
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
  Future<DefaultResponseModel> receivedRewardList() async {
    return await RewardAPI.roundList(null).request();
  }

  @override
  Future<DefaultResponseModel> selectWeekReward(
      String type, String rewardId, int round, int week) async {
    return await RewardAPI.saveReward(
            {'type': type, 'rewardId': rewardId, 'round': round, 'week': week})
        .request();
  }
}
