import '../../domain/repositories/emotion/today_emotion_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';

///
/// Repository with EMA
///
class TodayEmotionRepositoryImpl extends TodayEmotionRepository {
  @override
  Future<DefaultResponseModel> saveEma(int emotionValue) async {
    return await ETCAPI.todayEmotion({'emotion': emotionValue}).request();
  }
}
