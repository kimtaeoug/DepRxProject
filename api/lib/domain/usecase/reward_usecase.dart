import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/reward/final_reward_model.dart';
import '../../data/model/reward/reward_model.dart';
import '../../data/model/reward/reward_select_model.dart';
import '../../data/model/reward/reward_total_model.dart';
import '../../data/model/step/step_item_model.dart';
import '../repositories/reward/reward_repository.dart';
///
/// UseCase with Reward
///
class RewardUseCase {
  final RewardRepository _repository;

  RewardUseCase(this._repository);

  Future receivedRewardList(
      {required Function(List<StepItemModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getTotalRewardList();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<StepItemModel> result = [];
        for (dynamic item in response.data) {
          result.add(StepItemModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future selectWeekReward(
      String type, String rewardId, int round, int week,
      {required Function() successFunction,
        required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.selectWeekReward(type, rewardId, round, week);
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

  Future getTotalRewardList(
      {required Function(List<RewardTotalModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getTotalRewardList();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<RewardTotalModel> result = [];
        for (dynamic data in response.data) {
          result.add(RewardTotalModel.fromJson(data));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getStampReward(int round,
      {required Function(List<RewardModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getStampReward(round);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<RewardModel> result = [];
        for (dynamic data in response.data) {
          result.add(RewardModel.fromJson(data));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getMainRewardList(
      {required Function(List<StepItemModel>) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getMainRewardList();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        List<StepItemModel> result = [];
        for (dynamic item in response.data) {
          result.add(StepItemModel.fromJson(item));
        }
        successFunction(result);
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getFinalReward(
      {required Function(FinalRewardModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getFinalReward();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(FinalRewardModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
