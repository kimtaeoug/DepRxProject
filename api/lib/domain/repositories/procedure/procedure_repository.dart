///
/// Procedure 관련 Repository
///
abstract class ProcedureRepository{
  //절차
  Future getProcedure(String accessToken, String fcmToken, bool recursionFlag);

  //추천 BA 리스트 가져오기
  Future getRecommendedBAList();

  //주간 보상 리스트
  Future getWeekRewardList(int week);

  //주간 보상 수령
  Future receiveWeekReward(int round, int week);

  //주간 리포트
  Future weekReport(int round, int week);

}