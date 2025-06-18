import '../../domain/repositories/sdui/sdui_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';


///
/// Repository with SDUI
///
class SDUIRepositoryImpl extends SDUIRepository {
  @override
  Future<DefaultResponseModel> getSDUI(List<String> interestList) async {
    return await ETCAPI.sdui({'interest': interestList}).request();
  }
}
