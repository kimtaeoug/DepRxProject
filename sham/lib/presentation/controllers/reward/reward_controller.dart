import 'package:core/core.dart';
import 'package:api/api.dart';

import 'package:get/get.dart';

import '../../../core/service/procedure_service.dart';

class RewardController extends GetxController {
  final RewardUseCase useCase;
  final ReportUseCase reportUseCase;

  RewardController(this.useCase, this.reportUseCase);

  final ProcedureService service = Get.find();

  bool get serviceLoading => service.loading;

  int get week => service.week;

  int get round => service.round;

  ///
  /// RewardMain Step
  ///

  RxMap<int, StepItemModel> stepMap = <int, StepItemModel>{}.obs;
  RxBool stepLoading = false.obs;

  void initStep({bool isFinal = false}) async {
    if (stepMap.isEmpty || isFinal) {
      if (isFinal) {
        stepMap.clear();
      }
      stepLoading.value = true;
      await useCase.getMainRewardList(successFunction: (response) {
        for (StepItemModel data in response) {
          stepMap[data.week] = data;
        }
        stepMap.refresh();
        stepLoading.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.rewardMainPage);
        stepLoading.value = false;
      });
    }
  }

  ///
  /// Total Reward
  ///

  RxMap<int, List<RewardModel>> totalReward = <int, List<RewardModel>>{}.obs;
  RxMap<int, List<RewardModel>> stampReward = <int, List<RewardModel>>{}.obs;
  RxMap<int, List<RewardModel>> emotionReward = <int, List<RewardModel>>{}.obs;
  RxMap<int, List<RewardModel>> activityReward = <int, List<RewardModel>>{}.obs;
  RxBool totalLoading = true.obs;

  RxBool totalEmpty = true.obs;
  RxBool stampEmpty = true.obs;
  RxBool emotionEmpty = true.obs;
  RxBool activityEmpty = true.obs;

  void initTotalReward({bool isFinal = false}) async {
    if (totalReward.isEmpty || isFinal) {
      if (isFinal) {
        totalReward.clear();
        stampReward.clear();
        emotionReward.clear();
        activityReward.clear();
      }
      await useCase.getTotalRewardList(successFunction: (response) {
        for (RewardTotalModel item in response) {
          int week = item.week;
          totalReward[week] = item.stamp + item.emotion + item.activity;
          if (totalEmpty.value) {
            if (totalReward[week] != null &&
                (totalReward[week]?.isNotEmpty == true)) {
              totalEmpty.value = false;
            }
          }
          stampReward[week] = item.stamp;
          if (stampEmpty.value) {
            if (stampReward[week] != null &&
                (stampReward[week]?.isNotEmpty == true)) {
              stampEmpty.value = false;
            }
          }
          emotionReward[week] = item.emotion;
          if (emotionEmpty.value) {
            if (emotionReward[week] != null &&
                (emotionReward[week]?.isNotEmpty == true)) {
              emotionEmpty.value = false;
            }
          }
          activityReward[week] = item.activity;
          if (activityEmpty.value) {
            if (activityReward[week] != null &&
                (activityReward[week]?.isNotEmpty == true)) {
              activityEmpty.value = false;
            }
          }
        }
        totalReward.refresh();
        stampReward.refresh();
        emotionReward.refresh();
        activityReward.refresh();
        totalLoading.value = false;
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.rewardMainPage);
      });
    }
  }

  bool isEmptyWeek(int week) => !totalReward.keys.contains(week);

  ///
  /// 주간 보상 수령
  ///
  Rx<RewardModel> receiveWeekReward = const RewardModel().obs;

  bool rewardEmpty(RewardModel data) {
    return data.week == 0 && data.imagePath == '' && data.label == '';
  }

  RxBool receiveWeekLoading = false.obs;

  void getReceiveWeekReward() async {
    if (!receiveWeekLoading.value) {
      receiveWeekLoading.value = true;
      await useCase.receiveWeekReward(service.round, service.apiWeek,
          successFunction: (response) {
        receiveWeekReward.value = response;
        receiveWeekLoading.value = false;
      }, failFunction: (error) {
        receiveWeekLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.rewardReceiveWeekPage);
      });
    }
  }

  ///
  /// 주간 보상 선택지
  ///
  Rx<RewardSelectModel> selectReward2Week = const RewardSelectModel().obs;

  RxInt selectedWeek = 0.obs;
  RxList<RewardModel> selectedRewardList = <RewardModel>[].obs;
  RxBool selectedLoading = false.obs;

  void getSelectRewardList(
      {required Function(RewardSelectModel) successFunction,
      bool isRsi = false}) async {
    if (!selectedLoading.value) {
      selectedLoading.value = true;
      await useCase.getWeekRewardList(isRsi ? 1 : service.week,
          successFunction: (response) {
        selectReward2Week.value = response;
        successFunction(response);
        selectedLoading.value = false;
      }, failFunction: (error) {
        if (error.errorCode == 'BA003') {
          selectedLoading.value = false;
          selectReward();
        } else {
          selectedLoading.value = false;
          ErrorHandler.manageError(error.errorCode, Get.currentRoute,
              moveRoute: Routes.rewardSelectPage);
        }
      });
    }
  }

  ///
  /// 주간 보상 선택
  ///
  Rx<RewardModel> selectedRewardValue = const RewardModel().obs;
  RxString type = ''.obs;
  RxBool selectRewardLoading = false.obs;

  void selectReward({bool isJump = false, bool isRsi = false}) async {
    if (isJump) {
      selectRewardLoading.value = false;
    }
    if (!selectRewardLoading.value) {
      selectedLoading.value = true;
      await useCase.selectWeekReward(
          isJump ? 'WA002' : type.value,
          selectedRewardValue.value.rewardId,
          service.round,
          isRsi ? 1 : service.week, successFunction: () {
        selectedLoading.value = false;
        service.move(passNextStep: isJump ? true : false);
      }, failFunction: (error) {
        selectedLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute);
      });
    }
  }

  ///
  ///
  ///

  void getRewardFinal(
      {required Function(FinalRewardModel) successFunction}) async {
    await useCase.getFinalReward(
        successFunction: successFunction,
        failFunction: (error) {
          ErrorHandler.manageError(error.errorCode, Get.currentRoute,
              moveRoute: Routes.rewardFinalPage);
        });
  }

  ///
  /// Get Week Report
  ///
  void getWeekReport(int week, int round,
      {required Function(ReportModel) successFunction,
      required Function() failFunction}) async {
    await reportUseCase.weekReport(round, week,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        failFunction();
      });
    });
  }

  ///
  /// Get StampReward
  ///
  void getStampReward(int week, int round,
      {required Function(List<RewardModel>) successFunction,
      required Function() failFunction}) async {
    await useCase.getStampReward(round, successFunction: successFunction,
        failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        failFunction();
      });
    });
  }

  RxBool kbadsLoading = false.obs;
}
