import '../../domain/repositories/bdi/bdi_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/bdi_api.dart';

///
/// Repository with BDI
///
class BDIRepositoryImpl extends BDIRepository {
  @override
  Future<DefaultResponseModel> autoComplete() async {
    return await BDIAPI.autoComplete(null).request();
  }

  @override
  Future<DefaultResponseModel> bdiResult() async {
    return await BDIAPI.result(null).request();
  }

  @override
  Future<DefaultResponseModel> saveBDI(List<int> bdiList) async {
    return await BDIAPI.save({'bdiList': bdiList}).request();
  }

  @override
  Future<DefaultResponseModel> waitBDI() async {
    return await BDIAPI.wait(null).request();
  }

  @override
  Future<DefaultResponseModel> startProgram() async {
    return await BDIAPI.startProgram(null).request();
  }
}
