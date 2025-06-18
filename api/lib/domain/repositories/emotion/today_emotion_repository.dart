///
/// 감정 상태 관련 Repository
///
abstract class TodayEmotionRepository{
  //감정 상태 저장
  Future saveEma(int emotionValue);
}