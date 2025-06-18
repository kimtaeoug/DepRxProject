import '../../domain/repositories/ranking/ranking_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';

///
/// Repository with Ranking
///
class RankingRepositoryImpl extends RankingRepository {
  @override
  Future<DefaultResponseModel> getRankingData(int week) async {
    return await ETCAPI.ranking({'week': week}).request();
  }
}
