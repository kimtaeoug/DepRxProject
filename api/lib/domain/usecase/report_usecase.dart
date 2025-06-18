import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/report/report_model.dart';
import '../../data/model/report/week_report_item_model.dart';
import '../repositories/report/report_repository.dart';

///
/// UseCase with Report
///
class ReportUseCase {
  final ReportRepository _repository;

  ReportUseCase(this._repository);

  Future weekReport(int round, int week,
      {required Function(ReportModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.weekReport(round, week);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ReportModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future roundReport(int round,
      {required Function(List<WeekReportItemModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.roundReport(round);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<WeekReportItemModel> result = [];
        for (dynamic item in response.data) {
          result.add(WeekReportItemModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future checkReport(int week, int round,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.checkReport(round, week);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
