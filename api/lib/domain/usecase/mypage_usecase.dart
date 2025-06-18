import 'package:api/data/model/mypage/mypage_all_alarm_model.dart';
import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/mypage/mypage_alarm_model.dart';
import '../../data/model/mypage/mypage_marketing_model.dart';
import '../../data/model/reward/reward_model.dart';
import '../repositories/mypage/mypage_repository.dart';

///
/// UseCase with MyPage
///
class MyPageUseCase {
  final MyPageRepository _repository;

  MyPageUseCase(this._repository);

  Future changeMarketing(bool marketing,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.changeMyPageMarketing(marketing);
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

  Future changeAlarm(List<List<bool>> alarmList,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.changeAlarm(alarmList);
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

  Future getMyPageReward(
      {required Function(List<RewardModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getMyPageReward();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<RewardModel> result = [];
        for (dynamic item in response.data) {
          result.add(RewardModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getMyPageAlarm(
      {required Function(MyPageAlarmModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getMyPageAlarm();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(MyPageAlarmModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getMyPageMarketingValue(
      {required Function(MyPageMarketingModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getMyPageMarketing();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(MyPageMarketingModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getMyPageAllAlarm(
      {required Function(bool) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getSysAlarm();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction((MyPageAllAlarmModel.fromJson(response.data)).allAlarm);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future changeMyPageAllAlarm(bool input,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.changeSysAlarm(input);
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
