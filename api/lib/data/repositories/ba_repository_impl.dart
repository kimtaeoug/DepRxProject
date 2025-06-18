
import '../../domain/entities/ba/ongoing_ba_entity.dart';
import '../../domain/entities/ba/selected_ba_entity.dart';
import '../../domain/repositories/ba/ba_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/ba_api.dart';

///
/// Repository with BA
///
class BARepositoryImpl extends BARepository {
  @override
  Future<DefaultResponseModel> getMonthBAList(String yearMonth) async {
    return await BAAPI.getMonthBAList({'yearMonth': yearMonth}).request();
  }

  @override
  Future<DefaultResponseModel> getRecommendedBAList() async {
    return await BAAPI.getRecommendedBAList(null).request();
  }

  @override
  Future<DefaultResponseModel> getTodayBAList() async {
    return await BAAPI.getTodayBAList(null).request();
  }

  @override
  Future<DefaultResponseModel> saveBA(OngoingBAEntity data) async {
    return await BAAPI.saveBA(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> saveSelectedBA(SelectedBAEntity data) async {
    return await BAAPI.selectedBA(data.toJson()).request();
  }

  @override
  Future<DefaultResponseModel> getProgramInfo() async {
    return await await BAAPI.getProgramInfo(null).request();
  }
}
