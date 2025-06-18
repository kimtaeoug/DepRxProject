import 'package:api/data/model/default_response_model.dart';
import 'package:api/data/provider/api/diary_api.dart';
import 'package:api/domain/repositories/diary/diary_repository.dart';

///
/// Repository with Diary
///
class DiaryRepositoryImpl extends DiaryRepository {
  @override
  Future<DefaultResponseModel> saveRm(
      int round, int week, List<String> rmList) async {
    return await DiaryAPI.saveRm(
        {'round': round, 'week': week, 'answerList': rmList}).request();
  }

  @override
  Future<DefaultResponseModel> saveTd(String contents) async {
    return await DiaryAPI.saveTd({'contents': contents}).request();
  }

  @override
  Future<DefaultResponseModel> saveTed(String emotion) async {
    return await DiaryAPI.saveTed({'emotion': emotion}).request();
  }

  @override
  Future getRm(int week, int round) async {
    return await DiaryAPI.getRm({'week': week, 'round': round}).request();
  }

  @override
  Future getTd(String date) async {
    return await DiaryAPI.getTd({'date': date}).request();
  }

  @override
  Future getTed(String date) async {
    return await DiaryAPI.getTed({'date': date}).request();
  }

  @override
  Future<DefaultResponseModel> getProgramInfo() async {
    return await await DiaryAPI.getProgramInfo(null).request();
  }

  @override
  Future<DefaultResponseModel> month(String yearMonth) async {
    return await DiaryAPI.month({'yearMonth': yearMonth}).request();
  }
}
