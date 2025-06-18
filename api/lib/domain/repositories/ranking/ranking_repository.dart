
import '../../../data/model/default_response_model.dart';

///
/// Ranking
///
abstract class RankingRepository{
  Future<DefaultResponseModel> getRankingData(int week);
}