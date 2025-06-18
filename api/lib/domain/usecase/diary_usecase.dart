import 'package:api/api.dart';
import 'package:api/data/model/diary/rm_model.dart';
import 'package:api/domain/repositories/diary/diary_repository.dart';
import 'package:core/core.dart';

///
/// UseCase with Diary
///
class DiaryUseCase {
  final DiaryRepository _repository;

  DiaryUseCase(this._repository);

  Future saveRm(int week, int round, List<String> rmList,
      Function() successFunction, Function(dynamic) failFunction) async {
    DefaultResponseModel response =
        await _repository.saveRm(round, week, rmList);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }

  Future saveTd(String contents, Function() successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.saveTd(contents);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }

  Future saveTed(String emotion, Function() successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.saveTed(emotion);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
  Future getTed(String date, Function(DiaryModel) successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.getTed(date);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(DiaryModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
  Future getTd(String date, Function(DiaryModel) successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.getTd(date);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(DiaryModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
  Future getRm(int week, int round, Function(RmModel) successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.getRm(week, round);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(RmModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
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
  Future getMonthData(
      String yearMonth,
      Function(List<TaskModel>) successFunction,
      Function(dynamic) failFunction) async {
    DefaultResponseModel response = await _repository.month(yearMonth);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<TaskModel> result = [];
        for (dynamic item in response.data) {
          result.add(TaskModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
}
