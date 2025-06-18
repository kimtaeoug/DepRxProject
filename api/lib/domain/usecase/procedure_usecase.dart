import 'package:core/core.dart';
import '../../data/model/activity/ba_recommended_model.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/procedure/procedure_model.dart';
import '../../data/model/report/report_model.dart';
import '../../data/model/reward/reward_model.dart';
import '../../data/model/reward/reward_select_model.dart';
import '../repositories/procedure/procedure_repository.dart';

///
/// UseCase with Procedure
///
class ProcedureUseCase {
  final ProcedureRepository _repository;

  ProcedureUseCase(this._repository);

  final Exception loginFailException =
      Exception('Server Error : response type is no ProcedureModel');

  Future getProcedure(String accessToken, String fcmToken, bool recursionFlag,
      {required Function(ProcedureModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.getProcedure(accessToken, fcmToken, recursionFlag);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProcedureModel.fromJson(response.data));
      } else {
        throw Exception(loginFailException);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future updateProcedure(String accessToken, String fcmToken,
      {required Function(ProcedureModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.getProcedure(accessToken, fcmToken, false);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProcedureModel.fromJson(response.data));
      }else{
        throw Exception(response);
      }
    } catch (e, s) {
      failFunction(response);
    }
  }

  Future<void> getRecommendedBAList(
      {required Function(BARecommendedModel) successFunction,
      required Function(dynamic error) failFunction}) async {
    DefaultResponseModel response = await _repository.getRecommendedBAList();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        BARecommendedModel data = BARecommendedModel.fromJson(response.data);
        successFunction(data);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getWeekRewardList(int week,
      {required Function(RewardSelectModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getWeekRewardList(week);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(RewardSelectModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future receiveWeekReward(int round, int week,
      {required Function(RewardModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.receiveWeekReward(round, week);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(RewardModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

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
}
