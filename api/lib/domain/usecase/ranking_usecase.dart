import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/ranking/ranking_model.dart';
import '../repositories/ranking/ranking_repository.dart';

///
/// UseCase with Ranking
///
class RankingUseCase {
  final RankingRepository _repository;

  RankingUseCase(this._repository);

  Future getRankingData(int week,
      {required Function(RankingModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getRankingData(week);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(RankingModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}