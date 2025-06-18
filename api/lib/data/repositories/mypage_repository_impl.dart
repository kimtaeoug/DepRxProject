import '../../domain/repositories/mypage/mypage_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/mypage_api.dart';

///
/// Repository with MyPage
///
class MyPageRepositoryImpl extends MyPageRepository {
  @override
  Future<DefaultResponseModel> changeAlarm(List<List<bool>> alarmList) async {
    return await MyPageAPI.resetMyPageAlarm({'availableTimes': alarmList})
        .request();
  }

  @override
  Future<DefaultResponseModel> changeMyPageMarketing(bool marketing) async {
    return await MyPageAPI.changeMyPageMarketing({'marketing': marketing})
        .request();
  }

  @override
  Future<DefaultResponseModel> getMyPageReward() async {
    return await MyPageAPI.getMyPageReward(null).request();
  }

  @override
  Future<DefaultResponseModel> getMyPageAlarm() async {
    return await MyPageAPI.getMyPageAlarm(null).request();
  }

  @override
  Future<DefaultResponseModel> getMyPageMarketing() async {
    return await MyPageAPI.getMarketing(null).request();
  }

  @override
  Future<DefaultResponseModel> changeSysAlarm(bool value)async {
    return await MyPageAPI.changeSysAlarm({'allAlarm' : value}).request();
  }

  @override
  Future<DefaultResponseModel> getSysAlarm() async{
    return await MyPageAPI.getSysAlarm().request();
  }

}
