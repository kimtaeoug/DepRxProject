import 'package:core/core.dart';
import '../../data/model/activity/ba_do_model.dart';
import '../../data/model/activity/ba_month_item_model.dart';
import '../../data/model/activity/ba_recommended_model.dart';
import '../../data/model/activity/program_info_model.dart';
import '../../data/model/activity/remain_ba_model.dart';
import '../../data/model/default_response_model.dart';
import '../entities/ba/ongoing_ba_entity.dart';
import '../entities/ba/selected_ba_entity.dart';
import '../repositories/ba/ba_repository.dart';

///
/// UseCase with BA
///
class BAUseCase {
  final BARepository _repository;

  BAUseCase(this._repository);

  Future saveSelectedBA(SelectedBAEntity data, Function() successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.saveSelectedBA(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e, s) {
      failFunction(response);
    }
  }

  Future getTodayBAList(
      {required Function(List<BADoModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getTodayBAList();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<BADoModel> result = [];
        for (dynamic d in response.data) {
          result.add(BADoModel.fromJson(d));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e, s) {
      failFunction(response);
    }
  }

  Future saveOnGoingBA(OngoingBAEntity data,
      {required Function(RemainBAModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.saveBA(data);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(RemainBAModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e, s) {
      failFunction(response);
    }
  }

  Future<BARecommendedModel?> getRecommendedBAList(
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
    } catch (e, s) {
      failFunction(response);
    }
  }

  Future getMonthData(
      String yearMonth,
      Function(List<BAMonthItemModel>) successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.getMonthBAList(yearMonth);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<BAMonthItemModel> result = [];
        for (dynamic item in response.data) {
          result.add(BAMonthItemModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getProgramInfo(
      {required Function(ProgramInfoModel) successFunction,
      required Function(dynamic error) failFunction}) async {
    DefaultResponseModel response = await _repository.getProgramInfo();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProgramInfoModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
