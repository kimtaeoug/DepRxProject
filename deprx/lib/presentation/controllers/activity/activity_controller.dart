import 'package:common/component/feature/activity/activity_select_frame.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import 'package:deprx/core/service/procedure_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class ActivityController extends GetxController {
  final BAUseCase useCase;
  final RewardUseCase rewardUseCase;

  ActivityController(this.useCase, this.rewardUseCase);

  final ProcedureService service = Get.find();

  int get week => service.week;

  RxList<ActivitySelectItemModel> activitySelectList =
      <ActivitySelectItemModel>[].obs;
  RxList<Widget> frameList = <Widget>[].obs;

  Rx<DateTime> selectedData = DateTime.now().obs;
  RxBool recommendedBALoading = false.obs;

  void initRecommendedBA() async {
    recommendedBALoading.value = true;
    await useCase.getRecommendedBAList(successFunction: (response) {
      if (activitySelectList.isNotEmpty) {
        activitySelectList.clear();
      }
      if (frameList.isNotEmpty) {
        frameList.clear();
      }
      List<ActivitySelectItemModel> dataList = response.actionList;
      activitySelectList.value = dataList;
      activitySelectList.refresh();
      List<Widget> widgetList = makeActivitySelectFrame(dataList);
      frameList.value = widgetList;
      frameList.refresh();
      recommendedBALoading.value = false;
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.activitySelectPage);
      recommendedBALoading.value = false;
    });
  }

  ///check
  List<Widget> makeActivitySelectFrame(List<ActivitySelectItemModel> dataList) {
    List<Widget> widgetList = [];
    for (int idx = 0; idx < dataList.length; idx++) {
      widgetList.add(GetBuilder<ActivityController>(builder: (controller) {
        return ActivitySelectFrame(
          data: dataList[idx],
          idx: idx,
          containEmpty: controller.containEmpty,
          selectBA: controller.selectBA,
        );
      }));
    }
    return widgetList;
  }

  RxList<List<int>> selectedActivityList = <List<int>>[
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1]
  ].obs;
  RxList<List<String>> selectedBAList = <List<String>>[
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
  ].obs;

  void _changeValue(int widgetIdx, int first, int second) {
    selectedActivityList[widgetIdx] = [first, second];
    selectedActivityList.refresh();
  }

  void _selectBAGA(int widgetIdx, int idx, {bool isSelect = false}) {
    try {
      List<String> selectList = selectedBAList[widgetIdx];
      GAUtil.trackEvent(
          name: isSelect ? GAEventList.BA_SELECT_CLICK : GAEventList.BA_DSELECT_CLICK,
          params: {GAParameter.ACTIVITY_NAME: selectList[idx]});
    } catch (e) {
      Log.e(e);
    }
  }

  void selectBA(int widgetIdx, int idx, Function() function) {
    try{
      List<int> valueList = selectedActivityList[widgetIdx];
      int length = valueList.where((value) => value == -1).length;
      if (valueList.contains(idx)) {
        _selectBAGA(widgetIdx, idx);
        int containIdx = valueList.indexOf(idx);
        if (containIdx == 0) {
          _changeValue(widgetIdx, -1, valueList.last);
        } else {
          _changeValue(widgetIdx, valueList.first, -1);
        }
      } else {
        _selectBAGA(widgetIdx, idx, isSelect: true);
        if (length == 2) {
          _changeValue(widgetIdx, idx, -1);
        } else if (length == 1) {
          bool isFirstTime = valueList.first == -1;
          if (isFirstTime) {
            _changeValue(widgetIdx, idx, valueList.last);
          } else {
            _changeValue(widgetIdx, valueList.first, idx);
          }
        } else {
          function();
          GAUtil.trackEvent(
              name: GAEventList.BA_SELECTION_ERROR,
              params: {GAParameter.ERROR_MESSAGE: '이미 선택된 활동을 다시 눌러 해제해주세요'});
        }
      }
      update();
    }catch(e){
      ToastHandler().logicError();
      ErrorHandler.goErrorPage(Routes.activitySelectPage);
    }
  }

  void saveBA(int widgetIdx) {
    try{
      List<BAModel> baList = activitySelectList[widgetIdx].baList;
      int firstIdx = selectedActivityList[widgetIdx].first;
      int lastIdx = selectedActivityList[widgetIdx].last;
      if (firstIdx != -1) {
        selectedBAList[widgetIdx] = [
          baList[firstIdx].activityId,
          selectedBAList[widgetIdx].last
        ];
      }
      if (lastIdx != -1) {
        selectedBAList[widgetIdx] = [
          selectedBAList[widgetIdx].first,
          baList[firstIdx].activityId,
        ];
      }
      selectedBAList.refresh();
    }catch(e){
      ToastHandler().logicError();
      ErrorHandler.goErrorPage(Routes.activitySelectPage);
    }
  }

  SelectedBAEntity convertIdxToBA() {
    List<ActivitySelectItemModel> _activitySelectList = activitySelectList;
    List<SelectedBAItemEntity> result = [];
    for (int idx = 0; idx < _activitySelectList.length; idx++) {
      ActivitySelectItemModel data = _activitySelectList[idx];
      String date = data.date;
      List<String> selectedBAList = [];
      List<int> selectedIdxList = selectedActivityList[idx];
      for (int where in selectedIdxList) {
        if (data.baList.length > where) {
          selectedBAList.add(data.baList[where].activityId);
        }
      }
      result.add(SelectedBAItemEntity(date: date, selectedBa: selectedBAList));
    }
    return SelectedBAEntity(baList: result);
  }

  bool containEmpty(int widgetIdx, int idx) =>
      selectedActivityList[widgetIdx].contains(idx);

  void saveSelectedBA(SelectedBAEntity data, Function() successFunction,
      Function(dynamic) failFunction) async {
    await useCase.saveSelectedBA(data, successFunction, (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        failFunction(error);
      });
    });
  }

  void completeSelectedBA() async {
    try {
      SelectedBAEntity data = convertIdxToBA();
      if (data.baList.isNotEmpty) {
        if (!selectBALoading.value) {
          selectBALoading.value = true;
          saveSelectedBA(data, () {
            service.move();
            selectBALoading.value = false;
          }, (error) {
            throw Exception(error);
          });
        }
      } else {
        throw Exception('Data is Empty');
      }
    } catch (e, s) {
      Log.e('Error : $e\nStackTrace : $s');
      selectBALoading.value = false;
      ToastHandler().logicError();
      ErrorHandler.goErrorPage(Routes.activitySelectPage);
    }
  }

  ///
  /// Month
  ///
  RxBool monthLoading = true.obs;
  RxMap<String, List<BAMonthItemModel>> monthMap =
      <String, List<BAMonthItemModel>>{}.obs;

  bool checkDateExisting(DateTime time) {
    String yearMonth = TimeUtil.convertDateTo(time, 'yyyy-MM');
    if (monthMap.keys.contains(yearMonth)) {
      if ((monthMap[yearMonth]?.where((e) => e.day == time.day).isNotEmpty) ==
          true) {
        return true;
      }
    }
    return false;
  }

  List<BAModel> getSelectedDayList(DateTime time) {
    String yearMonth = TimeUtil.convertDateTo(time, 'yyyy-MM');
    if (monthMap.keys.contains(yearMonth)) {
      return monthMap[yearMonth]
              ?.where((e) => e.day == time.day)
              .first
              .baList ??
          [];
    } else {
      return [];
    }
  }

  void initMonthBA(DateTime selectedTime, {bool showToast = false}) async {
    String yearMonth = TimeUtil.convertDateTo(selectedTime, 'yyyy-MM');
    if (monthMap[yearMonth] == null || (monthMap[yearMonth]?.isEmpty == true)) {
      monthLoading.value = true;
      await useCase.getMonthData(yearMonth, (result) {
        monthMap[yearMonth] = result;
        monthMap.refresh();
        monthLoading.value = false;
      }, (error) async {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
        monthLoading.value = false;
      });
    }
  }

  Future<void> resetMonth() async {
    monthLoading.value = true;
    String yearMonth = TimeUtil.convertDateTo(DateTime.now(), 'yyyy-MM');
    await useCase.getMonthData(yearMonth, (result) {
      monthMap[yearMonth] = [];
      monthMap[yearMonth] = result;
      monthMap.refresh();
      monthLoading.value = false;
    }, (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          moveRoute: Routes.activityCompletePage);
      monthLoading.value = false;
    });
  }

  void calendarLeftFunction() {
    try{
      DateTime beforeTime = TimeUtil.calBeforeMonth(selectedData.value);
      if (beforeTime.isBefore(startDate.value)) {
        selectedData.value = startDate.value;
      } else {
        selectedData.value = beforeTime;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void calendarRightFunction() {
    try{
      DateTime afterTime = TimeUtil.calAfterMonth(selectedData.value);
      if (afterTime.isAfter(endDate.value)) {
        selectedData.value = endDate.value;
      } else {
        selectedData.value = afterTime;
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  final DateTime now = DateTime.now();

  late Rx<DateTime> startDate = now.obs;
  late Rx<DateTime> endDate = now.obs;
  RxBool programLoading = false.obs;

  void getProgramInfo() async {
    if (startDate.value == now || endDate.value == now) {
      programLoading.value = true;
      await useCase.getProgramInfo(successFunction: (response) {
        DateTime? start = DateTime.tryParse(response.startDate);
        DateTime? end = DateTime.tryParse(response.endDate);
        if (start != null && end != null) {
          startDate.value = start;
          endDate.value = end;
          if (selectedData.value.isAfter(endDate.value)) {
            selectedData.value = endDate.value;
          }
          programLoading.value = false;
        } else {
          throw Exception(response);
        }
      }, failFunction: (error) {
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            moveRoute: Routes.activityPage);
        programLoading.value = false;
      });
    }
  }

  Rx<OngoingBAEntity> ongoingBAValue = const OngoingBAEntity().obs;

  void completeBA(bool? fromHome) async {
    await useCase.saveOnGoingBA(ongoingBAValue.value,
        successFunction: (response) {
      if (response.remainActivity.isNotEmpty) {
        Get.toNamed(Routes.activityCompletePage, arguments: {
          'data': response.remainActivity.first,
          'fromHome': fromHome
        });
      } else {
        Get.toNamed(Routes.activityCompletePage,
            arguments: {'fromHome': fromHome});
      }
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute);
    });
  }

  RxList<BADoModel> ongoingBAList = <BADoModel>[].obs;
  RxBool ongoingLoading = true.obs;

  void getOnGoingBAList(
      String? activityId, bool? isBefore, bool? fromHome) async {
    if (ongoingBAList.isEmpty) {
      await useCase.getTodayBAList(successFunction: (response) {
        ongoingBAList.value = response;
        ongoingBAList.refresh();
        ongoingLoading.value = false;
      }, failFunction: (error) {
        ongoingLoading.value = false;
        ErrorHandler.manageError(error.errorCode, Get.currentRoute,
            errorFunction: (code) {
          Get.offNamed(Routes.activityEmotionPage, arguments: {
            'data': activityId,
            'isBefore': isBefore,
            'fromHome': fromHome
          });
        });
      });
    }
  }

  BADoModel getBADoModel(String activityId) =>
      ongoingBAList.where((e) => e.activityId == activityId).first;

  //rewardUseCase
  void checkStamp({bool? fromHome}) async {
    await rewardUseCase.getStampReward(service.round,
        successFunction: (result) {
      if (result.isNotEmpty) {
        Get.offNamed(Routes.rewardReceiveStampPage, arguments: {
          'data': result,
          'function': () {
            _move(hasReward: true, fromHome: fromHome);
          }
        });
      } else {
        _move(fromHome: fromHome);
      }
    }, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        _move(fromHome: fromHome);
      });
    });
  }

  void _move({bool hasReward = false, bool? fromHome}) async {
    try{
      await Get.find<HomeController>().resetAttendance();
      await resetMonth();
      if (fromHome == true) {
        Get.offNamedUntil(Routes.homePage, (_) => true);
      } else {
        Get.offNamedUntil(Routes.activityPage, (_) => true);
      }
    }catch(e){
      ToastHandler().logicError();
    }
  }

  void getSelectRewardList(int week,
      {required Function(RewardSelectModel) successFunction,
      required Function(dynamic) failFunction}) async {
    await rewardUseCase.getWeekRewardList(week,
        successFunction: successFunction, failFunction: (error) {
      ErrorHandler.manageError(error.errorCode, Get.currentRoute,
          errorFunction: (code) {
        failFunction(error);
      });
    });
  }

  RxBool selectBALoading = false.obs;
}
