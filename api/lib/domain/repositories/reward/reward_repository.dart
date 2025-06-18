///
/// Reward 관련  Repository
///
abstract class RewardRepository{
  //회차 보상 리스트
  Future receivedRewardList();
  //주간 보상 선택 저장
  Future selectWeekReward(String type, String rewardId, int round, int week);
  //주간 보상 수령
  Future receiveWeekReward(int round, int week);
  //주간 보상 리스트
  Future getWeekRewardList(int week);
  //전체 보상 리스트
  Future getTotalRewardList();
  //스템프 보상
  Future getStampReward(int round);
  //회차 보상 리스트
  Future getMainRewardList();
  //최종 보상
  Future getFinalReward();
}