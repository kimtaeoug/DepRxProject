import '../../domain/repositories/report/report_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/report_api.dart';

///
/// Repository with Report
///
class ReportRepositoryImpl extends ReportRepository {
  @override
  Future<DefaultResponseModel> roundReport(int round) async {
    return await ReportAPI.roundReport({'round': round}).request();
  }

  @override
  Future<DefaultResponseModel> weekReport(int round, int week) async {
    return await ReportAPI.weekReport({'round': round, 'week': week}).request();
  }

  @override
  Future<DefaultResponseModel> checkReport(int round, int week) async {
    return await ReportAPI.checkReport({'round': round, 'week': week})
        .request();
  }
}
