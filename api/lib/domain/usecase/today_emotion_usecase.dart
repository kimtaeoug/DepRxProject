import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../repositories/emotion/today_emotion_repository.dart';

///
/// UseCase with TodayEmotion
///
class TodayEmotionUseCase {
  final TodayEmotionRepository _repository;

  TodayEmotionUseCase(this._repository);

  Future completeTodayEmotion(int emotionValue,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.saveEma(emotionValue);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
