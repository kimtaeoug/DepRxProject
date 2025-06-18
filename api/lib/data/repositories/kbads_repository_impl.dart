import '../../domain/repositories/kbads/kbads_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';

///
/// Repository with KBADS
///
class KBADSRepositoryImpl extends KBADSRepository {
  @override
  Future<DefaultResponseModel> save(List<int> valueList, int week, int round) async {
   return await ETCAPI.kBADS({'kbadsAnswers': valueList, 'round' : round, 'week' : week}).request();
  }
}
